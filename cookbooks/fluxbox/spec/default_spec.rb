require 'chefspec'

describe 'fluxbox::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  
  it 'installs the fluxbox package' do
    expect(chef_run).to install_package('fluxbox')
  end
end
