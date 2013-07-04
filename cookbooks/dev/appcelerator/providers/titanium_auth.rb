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
