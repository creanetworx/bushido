class Product < ActiveRecord::Base

	# Relationship
  	belongs_to :article

  	# Named Scopes
  	scope :available, lambda{ where("available < ?", Date.today) }
  	scope :drafts, 	  lambda{ where("available > ?", Date.today) }

  	# Validations
  	validates :article, :title, :description, :price, :available, :presence => true
  	validates :featured, :inclusion => { :in => [true, false] }
end
