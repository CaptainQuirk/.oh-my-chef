
# Downloading batchelor configuration in hidden directory
git "#{ENV['HOME']}/.batchelor" do
  repository "https://github.com/CaptainQuirk/.batchelor.git"
  reference "master"
  user ENV['SUDO_USER']
  group ENV['SUDO_USER']
  enable_submodules true
  action :sync
end

# Launching command
#butler_launch 'welcome' do
  #command 'nano'
  #action :launch
#end
