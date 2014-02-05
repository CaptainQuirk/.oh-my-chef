# Setting paths
# -------------

root_path = File.expand_path(File.join(File.dirname(__FILE__), '..'))

# cookbooks
base_cookbook_path   = File.join(root_path, 'cookbooks')
vendor_cookbook_path = File.join(root_path, 'vendor/cookbooks')
cookbook_path [ base_cookbook_path, vendor_cookbook_path ]

# roles
role_path       File.join(root_path, 'roles')

# data bags
data_bag_path  File.join(root_path, 'data_bags')


# Move all the state stuff from /var/chef. 
# I wish there was a single config
# variable for this
# ---------------------------------------

state_root_path = File.expand_path('~/.chef/state')
file_cache_path  "#{state_root_path}/cache"
checksum_path    "#{state_root_path}/checksums"
sandbox_path     "#{state_root_path}/sandbox"
file_backup_path "#{state_root_path}/backup"
cache_options[:path] = file_cache_path


