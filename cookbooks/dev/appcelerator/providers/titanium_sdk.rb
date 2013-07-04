action :install do
  cmd  = "titanium sdk install" 
  cmd += "#{new_resource.version}" if new_resource.version
  cmd += " --quiet"
  execute "Installing Titanium SDK #{new_resource.name}" do
    command cmd
  end
end
