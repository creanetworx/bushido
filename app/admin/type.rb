ActiveAdmin.register Type, { :sort_order => :name_asc } do
  # Permitted parameters
  permit_params :name, :category_id

  # Displayed columns
  index do
  selectable_column
    column :name,  :sortable => :name
    column :category,    :sortable => :category
    actions
  end

  # Filters for each column within "description, image_file_name"
  filter :name
  filter :category,        :as => :select  
end