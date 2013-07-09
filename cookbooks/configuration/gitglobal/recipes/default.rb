# My Git global config
# --------------------

# Downloading git global conf files
git "#{ENV['HOME']}/.gitglobal" do
  repository "https://github.com/CaptainQuirk/.gitglobal.git"
  reference "master"
  enable_submodules true
  action :sync
end

# Symlinking this config file
link "#{ENV['HOME']}/.gitconfig" do
  to "#{ENV['HOME']}/.gitglobal/gitconfig"
  action :create
end


# Git subtree
# -----------

# making it executable
bash "making git subtree executable" do
  cwd ENV['HOME']
  command "chmod +x /usr/share/doc/git/contrib/subtree/git-subtree.sh"
  EOH
end

# Symlinking it
link "symlinking git subtree script" do
  target_file "/usr/lib/git-core/git-subtree"
  to "/usr/share/doc/git/contrib/subtree/git-subtree.sh"
end
