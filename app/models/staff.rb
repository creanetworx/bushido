class Staff < ActiveRecord::Base

  	# Relationship
  	belongs_to :job

  	# Validations
	validates :first_name, :last_name, :middle_name, :job, :phone, :pay, :start_at, :finish_at, :presence => true
end
