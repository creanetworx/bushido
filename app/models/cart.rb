class Cart < ActiveRecord::Base
   belongs_to :admin_user
   has_many :products, as: :bucket
   belongs_to :customer
   belongs_to :staff
   belongs_to :discount
end
