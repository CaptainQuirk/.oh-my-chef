actions :launch

attribute :command,          :default => nil
attribute :args,             :default => nil
attribute :opts,             :default => nil
attribute :sleep_time,       :default => 2 
attribute :script_path,      :default => "#{ENV['HOME']}/.batchelor/workplace/scripts/bash/"
attribute :return_file_path, :default => "#{ENV['HOME']}/.batchelor/tmp"
attribute :at_delay,         :default => 10
attribute :term_emulator,    :default => "xterm"
attribute :retry_count,      :default => 1

def initialize(*args)
  super
  @action = :launch
end
