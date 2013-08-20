require 'uuid'

action :launch do
  # Creating an available hash to be used as unique
  # script identifyier
  identifyier = script_identifyier

  # Creating file to hold return value
  return_file = "#{new_resource.return_file_path}/#{identifyier}"
  file return_file do
    owner ENV['SUDO_USER']
    group ENV['SUDO_USER']
    mode 0755
    action :create
  end

  # Building script with template
  script_filename = "#{new_resource.script_path}/#{identifyier}.sh"
  template script_filename do
    source "script.erb"
    cookbook "batchelor"
    owner ENV['SUDO_USER']
    group ENV['SUDO_USER']
    mode 0755
    variables(
      :command  => new_resource.command,
      :tmp_file => return_file
    )
  end

  # Looping endlessly while content of the tmp file is empty
  # sleeping as long as sleep_time is specified
  ruby_block "block_until_android_sdk_installed" do
    block do
      Chef::Log.info "Waiting until Android sdk installation is fullfilled ! "
      until ::File.read(return_file).match "0" do
        sleep new_resource.sleep_time
        Chef::Log.debug(".")
      end

      ::File.delete(return_file)
      ::File.delete(script_filename)
    end
  end
end

def script_identifyier
  uuid = UUID.new

  uuid.generate
end
