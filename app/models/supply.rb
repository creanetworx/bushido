class Supply < ActiveRecord::Base
	
	# Relationship
	has_many :providers, :dependent => :delete_all

	# Validations
	validates :title, :description, :presence => true
end
