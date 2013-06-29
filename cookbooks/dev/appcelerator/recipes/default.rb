# Installing oracle's java dev kit
package 'default-jdk'


# Installing android sdk
# ----------------------

# Extracting attribute values in attributes/default.rb
src_filename = "#{node['android-sdk']['filename']}"
src_url      = "#{node['android-sdk']['base_url']}/#{src_filename}"
src_checksum = "#{node['android-sdk']['checksum']}"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{ENV['HOME']}/.android/android-sdk"
bin_symlink  = "#{node['android-sdk']['bin_symlink']}"



# Getting remote archive
remote_file src_filepath do
  source src_url 
  checksum src_checksum 
  not_if { ::File.exists?(extract_path) }
end

bash 'extract_sdk' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    mkdir -p #{extract_path}
    chown -R #{ENV['SUDO_USER']}:#{ENV['SUDO_USER']} #{ENV['HOME']}/.android
    tar xzf #{src_filename} -C #{extract_path}
    mv #{extract_path}/*/* #{extract_path}/
  EOH
  not_if { ::File.exists?(extract_path) }
end

# Adding a symlink in ~/bin folder for program tools/android
link bin_symlink do
  to "#{extract_path}/tools/android"
  action :create
  not_if { ::File.exists?(bin_symlink) }
end

# Installing titanium
npm_package 'titanium'

# Extracting titanium data
titanium_bag = data_bag_item('credentials', 'titanium')

# Login to titanium account and downloading
appcelerator_titanium 'login' do
  login titanium_bag['login']
  password titanium_bag['password']
  action :login
end

appcelerator_titanium 'install_sdk' do
  action :install_sdk
end

appcelerator_titanium 'logout' do
  action :logout
end
