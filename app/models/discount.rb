class Discount < ActiveRecord::Base

	# Relationship
	has_many :customers

	# Validations
	validates :discount, :presence => true

	# Define for display discount of customer as discount %
    def to_s
  		"#{discount}"
  	end
end
