# Installing virtualbox package
package 'virtualbox'

# Cloning ievms project
git "#{ENV['HOME']}/.iemvs-script" do
  repository "https://github.com/xdissent/ievms.git"
  reference "master"
  action :sync
end

# New values in the crontab
