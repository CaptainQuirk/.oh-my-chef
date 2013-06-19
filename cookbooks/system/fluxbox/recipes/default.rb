package 'fluxbox'

git "#{ENV['HOME']}/.fluxbox" do
  repository "https://github.com/CaptainQuirk/.fluxbox.git"
  reference "master"
  enable_submodules true
  action :sync
end
