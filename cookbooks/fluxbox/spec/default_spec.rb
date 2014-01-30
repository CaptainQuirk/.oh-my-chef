require 'chefspec'

describe 'fluxbox::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  
  it 'installs the fluxbox package' do
    expect(chef_run).to install_package('fluxbox')
  end

  #it 'backs up the default fluxbox directory' do
    #expect(chef_run).to run_ruby_block("Rename fluxbox directory")
  #end

  it 'updates the .fluxbox directory through git' do
    expect(chef_run).to sync_git("#{ENV['HOME']}/.fluxbox").with(
      repository: "https://github.com/CaptainQuirk/.fluxbox.git",
      reference: "master",
      enable_submodules: true,
    )
  end
end
