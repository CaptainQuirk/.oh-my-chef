# Downloading batchelor configuration in hidden directory
git "#{ENV['HOME']}/.batchelor" do
  repository "https://github.com/CaptainQuirk/.batchelor.git"
  reference "master"
  user ENV['SUDO_USER']
  group ENV['SUDO_USER']
  enable_submodules true
  action :sync
end

npm_package 'install_dependencies' do
  path "#{ENV['HOME']}/.batchelor"
  action :install_all
end
