# Installing tmux package
package 'tmux'

# Loading template
#template "#{ENV['HOME']}/.tmux.conf" do
    #source "tmux.conf.erb"
#end

# Downloading tmux configuration in hidden directory
git "~/.tmux" do
  repository "https://github.com/CaptainQuirk/.tmux.git"
  reference "master"
  action :sync
end

# Symlinking this config file
