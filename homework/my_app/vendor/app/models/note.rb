class Note < ActiveRecord::Base
#associatin with model 'category' 
belongs_to :category
validates_presence_of :title, :description
end
