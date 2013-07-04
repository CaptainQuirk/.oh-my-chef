action :config do
  cmd  = "titanium config #{new_resource.key} #{new_resource.value}"
  execute "Setting value #{new_resource.value} for #{new_resource.key} key" do
    command cmd
  end
end
