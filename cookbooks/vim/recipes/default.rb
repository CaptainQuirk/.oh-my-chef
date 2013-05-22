# Installing tmux package
package 'vim'

# Downloading tmux configuration in hidden directory
git "#{ENV['HOME']}/.vim" do
  repository "https://github.com/CaptainQuirk/.vim.git"
  reference "master"
  action :sync
end

# Symlinking this config file
link "#{ENV['HOME']}/.vimrc" do
  to "#{ENV['HOME']}/.vim/vimrc"
  action :create
end
