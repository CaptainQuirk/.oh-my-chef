
# Node variables for android sdk
# ------------------------------

default['android-sdk']['filename']     = "android-sdk_r22.0.1-linux.tgz"
default['android-sdk']['base_url']     = "http://dl.google.com/android"
default['android-sdk']['checksum']     = "56ed27d456b4f0e0d3090b24f9b06757"
default['android-sdk']['extract_path'] = "#{ENV['HOME']}/.android/android-sdk"
default['android-sdk']['bin_symlink']  = "#{ENV['HOME']}/bin/android"
