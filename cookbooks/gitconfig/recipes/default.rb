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

