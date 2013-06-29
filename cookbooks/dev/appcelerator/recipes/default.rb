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
    chown #{ENV['SUDO_USER']}:#{ENV['SUDO_USER']}
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

# Launching the update command for the sdk tools/android sdk -u
bash 'update sdk' do
  cwd extract_path
  code <<-EOH
    ./tools/android update sdk -u
  EOH
end

# Installing npm ?

# Connecting to appcelerator's account to download sdk if it
# wasn't done

