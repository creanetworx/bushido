class Article < ActiveRecord::Base

	# Relationship
	has_many :products, :dependent => :delete_all

	# Validations
	validates :title, :description, :presence => true

	# Define for display a article for products as article code
    def to_s
  		"#{title}"
  	end
end
