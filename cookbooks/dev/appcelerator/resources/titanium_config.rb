actions :config

attribute :key, :default    => nil
attribute :value, :default => nil

def initialize(*args)
  super
  @action = :config
end
