template '/etc/default/grub' do
  source 'default.erb'
  backup 10
  owner 'root'
  group 'root'
end

batch 'update grub' do
  action :run
  command 'update-grub'
end
