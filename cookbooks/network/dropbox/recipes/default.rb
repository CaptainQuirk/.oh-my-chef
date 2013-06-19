remote_file "#{Chef::Config[:file_cache_path]}/dropbox_1.6.0_amd64.deb" do
    source "http://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb"
end

dpkg_package "#{Chef::Config[:file_cache_path]}/dropbox_1.6.0_amd64.deb" do
  action :install
end
