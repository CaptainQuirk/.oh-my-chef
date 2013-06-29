actions :login, :logout, :install_sdk

attribute :login, :default    => nil
attribute :password, :default => nil
attribute :version, :default => nil

def initialize(*args)
  super
  @action = :install
end
