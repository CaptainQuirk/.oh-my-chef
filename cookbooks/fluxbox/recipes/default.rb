# Install the fluxbox package
package 'fluxbox'

# Syncing fluxbox conf directory through git
git "#{ENV['HOME']}/.fluxbox" do
  repository "https://github.com/CaptainQuirk/.fluxbox.git"
  reference "master"
  enable_submodules true
  action :sync
end
