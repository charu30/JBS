class User < ActiveRecord::Base
  attr_accessible :usersname, :email_address, :password
  acts_as_authentic
end
