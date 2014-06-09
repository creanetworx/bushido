class Activity < ActiveRecord::Base
	
	# Relationship
	has_many :partners, :dependent => :delete_all

	# Validations
	validates :title, :description, :presence => true

	# Define for display a type of activity for partners as title of activity type
    def to_s
  		"#{title}"
  	end
end
