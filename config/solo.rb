root_path = File.expand_path(File.join(File.dirname(__FILE__), '..'))
 
base_cookbook_path = File.join(root_path, 'cookbooks')
cookbook_path [ "#{base_cookbook_path}/commands", "#{base_cookbook_path}/configuration", "#{base_cookbook_path}/dev", "#{base_cookbook_path}/graphics", "#{base_cookbook_path}/libs", "#{base_cookbook_path}/media", "#{base_cookbook_path}/network", "#{base_cookbook_path}/system", "#{base_cookbook_path}/utilities" ]
role_path       File.join(root_path, 'roles')
 

# Move all the state stuff from /var/chef. I wish there was a single config
# variable for this!a
state_root_path = File.expand_path('~/.chef/state')
file_cache_path  "#{state_root_path}/cache"
checksum_path    "#{state_root_path}/checksums"
sandbox_path     "#{state_root_path}/sandbox"
file_backup_path "#{state_root_path}/backup"
cache_options[:path] = file_cache_path

# Setting data_bag_path
data_bag_path  "#{ENV['HOME']}/.data"
