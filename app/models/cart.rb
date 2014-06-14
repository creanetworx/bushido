class Cart < ActiveRecord::Base
   belongs_to :admin_user
   belongs_to :customer
   belongs_to :staff
   belongs_to :discount
end
