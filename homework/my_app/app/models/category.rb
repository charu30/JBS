class Category < ActiveRecord::Base
#association with model notes
has_many :notes
validates_presence_of :description
validates_presence_of :name

end
