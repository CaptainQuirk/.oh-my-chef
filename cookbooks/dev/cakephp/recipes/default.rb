# Attributes
# ----------

# retrieving attributes/default.rb content
path               = node['cakephp']['path']
subtree_repo_name  = node['cakephp']['subtree_repo_name']
local_repo_name    = node['cakephp']['local_repo_name']
cakephp_repository = node['cakephp']['repository']
split_origin       = node['cakephp']['subtree_origin_name']
split_branch       = node['cakephp']['split_branch']

# Building convenience vars
cake_dir   = "#{ENV['HOME']}/#{path}/"
cake_repo  = "#{ENV['HOME']}/#{path}/#{local_repo_name}"
split_repo = "#{ENV['HOME']}/#{path}/#{subtree_repo_name}"


# Getting the source code
# -----------------------

# Creating base directory
directory cake_dir do
  owner ENV['SUDO_USER']
  group ENV['SUDO_USER']
  mode 0775
  action :create
end

# Setting action to automatically update
# the future split code
bash "merge-split-branch" do
  cwd cake_repo
  code <<-EOH
    git checkout -f #{split_branch}
    git merge master
  EOH
  action :nothing
  only_if { ::Dir.exists?(split_repo) }
  notifies :run, "bash[pushing-split-to-remote]"
end

# Downloading cakephp in hidden directory
git cake_repo do
  repository cakephp_repository
  reference "master"
  enable_submodules true
  user ENV['SUDO_USER']
  group ENV['SUDO_USER']
  action :sync
  notifies :run, 'bash[merge-split-branch]'
end


# Splitting the code
# ------------------

# Creating split code directory
directory split_repo do
  owner ENV['SUDO_USER']
  group ENV['SUDO_USER']
  mode 0775
  action :create
end

# Creating bare repository to hold the final split code
bash "Bare repository to hold the code" do
  cwd split_repo
  code <<-EOH
    git init --bare
  EOH
end

# Adding a remote to the main repo
bash "Adding a remote to main repo" do
  cwd cake_repo
  code <<-EOH
    test=`git remote show | grep -e "^\\s\\?#{split_origin}$"`
    if [ "$test" != '#{split_origin}' ];
    then
      git remote add #{split_origin} #{split_repo}
    fi
  EOH
end

# actual code split
bash "Splitting the code" do
  cwd cake_repo
  code <<-EOH
    test=`git branch -a | grep -e "^\\*\\?\\s\\?#{split_branch}$" | sed -e 's/\*//'`
    if [ "$test" != '#{split_branch}' ];
    then
      git subtree split --prefix=lib/Cake -b #{split_branch}
    fi
  EOH
  notifies :run, "bash[pushing-split-to-remote]"
end

# Pushing the split branch's code to the master
# branch on our split repo
bash "pushing-split-to-remote" do
  cwd cake_repo
  action :nothing
  code <<-EOH
    git push #{split_repo} #{split_branch}:master
  EOH
end
