actions :login, :logout

attribute :login, :default    => nil
attribute :password, :default => nil

def initialize(*args)
  super
  @action = :login
end
