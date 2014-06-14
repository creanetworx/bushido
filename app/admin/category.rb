ActiveAdmin.register Category, { :sort_order => :name_asc } do
  # Permitted parameters
  permit_params :name
end