actions :install

attribute :version, :default => nil

def initialize(*args)
  super
  @action = :install
end
