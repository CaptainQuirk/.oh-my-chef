# Creates a .xinitrc file from a template
template "#{ENV['HOME']}/.xinitrc" do
  source 'default.erb'
end
