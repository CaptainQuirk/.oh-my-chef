require 'chefspec'

describe 'x11::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'creates an .xinitrc file in my home directory' do
    expect(chef_run).to create_template("#{ENV['HOME']}/.xinitrc").with(
      source: 'default.erb',
    )
  end
end
