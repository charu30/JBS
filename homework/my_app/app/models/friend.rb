class Friend < ActiveRecord::Base
	
	validates_presence_of :name
	validates_presence_of :since
	validates_presence_of :group
	validates_presence_of :comment
end
