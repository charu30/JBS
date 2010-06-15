class User < ActiveRecord::Base
  attr_accessible :usersname, :email_address, :password
end
