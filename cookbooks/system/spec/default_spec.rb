require 'chefspec'

describe 'system::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the users recipe' do
    expect(chef_run).to include_recipe('users::sysadmins')
  end

  it 'includes the sudo recipe' do
    expect(chef_run).to include_recipe('sudo::default')
  end

  it 'includes the grub recipe' do
    expect(chef_run).to include_recipe('grub::default')
  end

  it 'includes the bash recipe' do
    expect(chef_run).to include_recipe('bash::default')
  end

  it 'includes the X recipe' do
    expect(chef_run).to include_recipe('x11::default')
  end

  it 'includes the fluxbox recipe' do
    expect(chef_run).to include_recipe('fluxbox::default')
  end
end
