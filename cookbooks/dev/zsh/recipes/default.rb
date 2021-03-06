# Installing tmux package
package 'zsh'

# Downloading tmux configuration in hidden directory
git "#{ENV['HOME']}/.zsh" do
  repository "https://github.com/CaptainQuirk/.zsh.git"
  reference "master"
  enable_submodules true
  action :sync
end

# Symlinking this config file
link "#{ENV['HOME']}/.zshrc" do
  to "#{ENV['HOME']}/.zsh/zshrc"
  action :create
end

# Changing default shell
if ENV['SHELL'] != '/bin/zsh'
  bash "change_default_shell" do
    cwd "#{ENV['HOME']}"
    code <<-EOH 
    sudo chsh -s /bin/zsh $SUDO_USER
    EOH
  end
end
