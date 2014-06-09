class Partner < ActiveRecord::Base

	# Relationship
  	belongs_to :activity
  	belongs_to :admin_user

  	# Validations
  	validates :title, :activity, :web_site, :contact, :phone, :email, :address, :admin_user_id, :presence => true
  	validates :is_new, 	   :inclusion => { :in => [true, false] }
  	validates :is_current, :inclusion => { :in => [true, false] }
  	validates :is_denied,  :inclusion => { :in => [true, false] }
end
