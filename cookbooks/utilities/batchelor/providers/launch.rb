action :launch do
  # Creating an available hash to be used as unique
  # script identifyier
  identifyier = script_identifyier

  # Building script with template
  script_filename = "#{new_resource.script_path}/#{identifyier}.sh"
  template script_filename do
    source "#{ENV['HOME']}/.oh-my-chef/cookbooks/utilities/batchelor/templates/default/script.erb"
    owner ENV['SUDO_USER']
    group ENV['SUDO_USER']
    mode 0755
    variables(
      :command  => new_resource.command,
      :tmp_file => "#{new_resource.return_file_path}/#{identifyier}"
    )
  end

  # Looping endlessly while content of the tmp file is empty
  # sleeping as long as sleep_time is specified
end

def script_identifyier
  "ddksqj4E3fdjqsgdee4ERS"
end
