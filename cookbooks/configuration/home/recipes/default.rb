# Home directory settings
# -----------------------

# Creating a bin directory if it doesn't exist
directory "#{ENV['home']}/bin" do
  owner ENV['SUDO_USER']
  group ENV['SUDO_USER']
  mode 0755
  action :create
end

# Creating a tmp directory if it doesn't exist
directory "#{ENV['home']}/tmp" do
  owner ENV['SUDO_USER']
  group ENV['SUDO_USER']
  mode 0755
  action :create
end
