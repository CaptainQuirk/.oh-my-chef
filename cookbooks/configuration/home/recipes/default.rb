# Home directory settings
# -----------------------

# Creating a bin directory if it doesn't exist
directory "#{ENV['HOME']}/bin" do
  owner ENV['SUDO_USER']
  group ENV['SUDO_USER']
  mode 0755
  action :create
end

# Adding some base bash commands
#file "upgrade-android-sdk" do
#  content "gnome-terminal -x sudo android update sdk -u"
#  owner ENV['SUDO_USER']
#  mode 0755
#  path "#{ENV['HOME']}/bin/upgrade-android-sdk"
#  action :create
#end

# Creating a tmp directory if it doesn't exist
directory "#{ENV['HOME']}/tmp" do
  owner ENV['SUDO_USER']
  group ENV['SUDO_USER']
  mode 0755
  action :create
end
