class Category < ActiveRecord::Base
	has_many :types
end
