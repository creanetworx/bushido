class AdminUser < ActiveRecord::Base

	# Devise mechanism for AdminUser
	#-----------------------------------------------------------#	
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, 
           :recoverable, :rememberable, :trackable, :validatable

    # Devise Callback sends the user a link to create a new password 
    after_create { |admin| admin.send_reset_password_instructions }

    # Method let a create a user without providing a password
    def password_required?
    	new_record? ? false : super
    end

    # Define for display name of user as email
    def to_s
  		"#{email}"
  	end
end
