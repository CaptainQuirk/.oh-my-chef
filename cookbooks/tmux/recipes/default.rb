# Installing tmux package
package 'tmux'

# Downloading tmux configuration in hidden directory
git "#{ENV['HOME']}/.tmux" do
  repository "https://github.com/CaptainQuirk/.tmux.git"
  reference "master"
  action :sync
end

# Symlinking this config file
link "#{ENV['HOME']}/.tmux.conf" do
  to "#{ENV['HOME']}/.tmux/tmux.conf"
  action :create
end
