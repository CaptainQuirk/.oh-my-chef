# Write the bash_profile dotfile
template "#{ENV['HOME']}/.bash_profile" do
  source 'bash_profile.erb'
  user "#{ENV['SUDO_USER']}"
  group "#{ENV['SUDO_USER']}"
end
