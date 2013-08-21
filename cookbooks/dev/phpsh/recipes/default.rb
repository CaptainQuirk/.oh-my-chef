# Installing package containing easy install
package 'python-setuptools'
package 'python-dev'
package 'libncurses5'
package 'libncurses5-dev'

# Installing readline
easy_install_package "readline" do
  action :install
end

git "#{ENV['HOME']}/git-phpsh" do
  repository "https://github.com/facebook/phpsh.git"
  user ENV['SUDO_USER']
  group ENV['SUDO_USER']
  reference "master"
  enable_submodules true
end

bash "install_phpsh_globally" do
  cwd "#{ENV['HOME']}/git-phpsh"
  code <<-EOH
    python setup.py install --prefix=~
    export PYTHONPATH=~/lib/python2.7/site-packages
  EOH
end
