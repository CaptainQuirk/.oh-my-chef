require 'chefspec'

describe 'bash::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'writes a .bash_profile file' do
    expect(chef_run).to create_template("#{ENV['HOME']}/.bash_profile").with(
      source: 'bash_profile.erb'
    )
  end
end
