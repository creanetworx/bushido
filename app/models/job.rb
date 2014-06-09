class Job < ActiveRecord::Base
	
	# Relationship
	has_many :staffs, :dependent => :delete_all

	# Validations
	validates :title, :description, :presence => true

	# Define for display a type of job for staff as title of job type
    def to_s
  		"#{title}"
  	end
end
