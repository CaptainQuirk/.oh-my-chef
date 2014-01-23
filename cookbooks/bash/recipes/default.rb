# Write the bash_profile dotfile
template "#{ENV['HOME']}/.bash_profile" do
  source 'bash_profile.erb'
  user "#{ENV['USER']}"
  group "#{ENV['USER']}"
end
