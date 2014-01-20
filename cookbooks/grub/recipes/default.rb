template '/etc/default/grub' do
  source 'default.erb'
  backup 10
  owner 'root'
  group 'root'
end

execute 'update grub' do
  command 'update-grub'
end
