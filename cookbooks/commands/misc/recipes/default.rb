# Retrieving commands to install
commands = node['commands']

commands.each do |key| 
  package key
end
