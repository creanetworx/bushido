# ActiveAdmin.register Cart, { :sort_order => :name_asc } do
#  # Permitted parameters
#  permit_params :customer_id, :staff_id, :admin_user_id, :discount_id

#  # Displayed columns
#   index do
#   	selectable_column
# 	    column :customer,  :sortable => :customer
# 	    column :staff,    :sortable => :staff
# 	    column :admin_user
# 	    column :discount,	:sortable => :discount
# 	    actions
#   end

#   filter :customer,			 :as => :select
#   filter :staff,         :as => :select
#   filter :admin_user
#   filter :discount,				:as => :select

# end