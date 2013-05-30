# Installing virtualbox package
package 'virtualbox'

# Cloning ievms project
git "#{ENV['HOME']}/.iemvs-script" do
  repository "https://github.com/xdissent/ievms.git"
  reference "master"
  action :sync
end

# New value in the crontab to execute vm download
# every last thursday of the month
cron "ievms" do
  hour "21"
  day "24-31"
  weekday "4"
  user ENV['USER']
  command "bash /home/$USER/.ievms-script/ievms.sh"
end
