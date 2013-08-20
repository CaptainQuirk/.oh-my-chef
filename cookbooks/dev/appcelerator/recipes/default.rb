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

# Extracting archive
bash 'extract_sdk' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    mkdir -p #{extract_path}
    tar -xzf #{src_filename} -C #{extract_path}
    mv #{extract_path}/*/* #{extract_path}/
    chown -R #{ENV['SUDO_USER']}:#{ENV['SUDO_USER']} #{ENV['HOME']}/.android
  EOH
  not_if { ::File.exists?(extract_path) }
end

# Adding a symlink in ~/bin folder for program tools/android
link bin_symlink do
  to "#{extract_path}/tools/android"
  owner ENV['SUDO_USER']
  group ENV['SUDO_USER']
  action :create
  not_if { ::File.exists?(bin_symlink) }
end

# Adding the extract path to system PATH
bash 'update-path-if-needed' do
  cwd ENV['home']
  code <<-EOH
    if [[ "$PATH" =~ (^|:)"#{extract_path}"(:|$) ]]
    then
        return 0
    fi
    export PATH=${1}:$PATH   
  EOH
end

# Launching the android sdk update command
batchelor_launch 'android-sdk-install' do
  action :launch
  command "android update sdk -u"
end

# Titanium SDK
# ------------

# Installing titanium
npm_package 'titanium'

# Extracting titanium data
titanium_credentials = data_bag_item('credentials', 'titanium')

# Login to titanium account and downloading
appcelerator_titanium_auth 'login' do
  login titanium_credentials['login']
  password titanium_credentials['password']
  action :login
end

# Configuring the cli
titanium_config = data_bag_item('configuration', 'titanium')

%w{name email default_locale workspace}.each do |key_name|
  appcelerator_titanium_config 'configure' do
    key key_name
    value titanium_config[key_name]
    action :config
  end
end

batchelor_launch 'titanium install' do
  action :launch
  command "titanium sdk update --install"
end

# Retrieving last version of cli throught sdk update

# Calling a special install command to
# get the cli's last version
# titanium sdk install --branch master --default

appcelerator_titanium_auth 'logout' do
  action :logout
end
