class Provider < ActiveRecord::Base
	  	
	# Relationship
  	belongs_to :supply

  	# Validations
  	validates :title, :supply, :web_site, :phone, :email, :open_at, :closed_at, :address, :presence => true
  	validates :shipping, :inclusion => { :in => [true, false] }
end
