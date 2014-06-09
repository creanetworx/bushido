class Customer < ActiveRecord::Base
	  	
  	# Relationship
  	belongs_to :discount

  	# Validations
	validates :first_name, :last_name, :middle_name, :phone, :email, :car, :discount, :presence => true
end
