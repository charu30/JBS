class Category < ActiveRecord::Base
#association with model notes
has_many :notes
end
