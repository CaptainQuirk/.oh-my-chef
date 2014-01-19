require 'chefspec'

describe 'system::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the grub recipe' do
    expect(chef_run).to include_recipe('grub::default')
  end
end