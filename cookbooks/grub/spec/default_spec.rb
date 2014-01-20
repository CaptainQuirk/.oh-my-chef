require 'chefspec'

describe 'grub::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'overwrites the existing /etc/default/grub file by a compiled template' do
    expect(chef_run).to create_template('/etc/default/grub').with(
      source: 'default.erb',
      backup: 10,
      owner: 'root',
      group: 'root'
    )
  end

  it 'updates grub config' do
    expect(chef_run).to run_execute('update grub').with(
      command: 'update-grub'
    )
  end
end

