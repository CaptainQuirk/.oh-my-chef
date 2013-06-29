# Installing oracle's java dev kit
package 'default-jdk'


# Installing android sdk
# ----------------------

# Extracting attribute values in attributes/default.rb
src_filename = "#{node['android-sdk']['filename']}"
src_url      = "#{node['android-sdk']['base_url']}/#{src_filename}"
src_checksum = "#{node['android-sdk']['checksum']}"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{ENV['home']}/.android/android-sdk"

# Getting remote archive
remote_file src_filepath do
  source src_url 
  checksum src_checksum 
end

bash 'extract_sdk' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    mkdir -p #{extract_path}
    tar xzf #{src_filename} -C #{extract_path}
    mv #{extract_path}/*/* #{extract_path}/
  EOH
  not_if { ::File.exists?(extract_path) }
end

# Adding a shortcut in ~/bin folder for program tools/android

# Launching the update command for the sdk tools/android sdk -u
bash 'update sdk' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    ./tools/android sdk -u
  EOH
end

# Installing npm ?

# Connecting to appcelerator's account to download sdk if it
# wasn't done

