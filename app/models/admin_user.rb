class AdminUser < ActiveRecord::Base


    has_one :cart
	# Devise mechanism for AdminUser
	#-----------------------------------------------------------#	
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, 
           :recoverable, :rememberable, :trackable, :validatable

    # Devise Callback sends the user a link to create a new password 
    after_create { |admin| admin.send_reset_password_instructions }
    after_save :create_cart_for_user

    # Method let a create a user without providing a password
    def password_required?
    	new_record? ? false : super
    end

    def create_cart_for_user
      self.create_cart if self.cart.blank?
    end

    # Define for display name of user as email
    def to_s
  		"#{email}"
  	end
end
