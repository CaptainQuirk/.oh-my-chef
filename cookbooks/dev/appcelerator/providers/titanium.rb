action :login do
  cmd  = "titanium login #{new_resource.login} #{new_resource.password}"
  execute "Login to titanium platform" do
    command cmd
  end
end

action :logout do
  cmd  = "titanium logout"
  execute "Logout from titanium platform" do
    command cmd
  end
end

action :install_sdk do
  cmd  = "titanium sdk install" 
  cmd += "#{new_resource.version}" if new_resource.version
  cmd += " --quiet"
  execute "Installing Titanium SDK #{new_resource.name}" do
    command cmd
  end
end
