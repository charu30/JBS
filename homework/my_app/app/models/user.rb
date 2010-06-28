#Implementing auth-logic

class User < ActiveRecord::Base
    #to add auth logic to the class
	acts_as_authentic
end
