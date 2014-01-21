require 'chefspec'

describe 'fluxbox::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  
  it 'installs the fluxbox package' do
    expect(chef_run).to install_package('fluxbox')
  end

  #it 'adds a line to .xinitrc to start fluxbox automatically' do
    #expect(chef_run).to create_file_if_missing("#{ENV['USER']}/.xinitrc").with(
      #action: :create_if_missing
    #)
  #end
end
