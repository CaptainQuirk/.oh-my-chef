# Installing tmux package
package 'tmux'

# Loading template
template "#{ENV['HOME']}/.tmux.conf" do
    source "tmux.conf.erb"
end
