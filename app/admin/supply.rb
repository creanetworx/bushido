ActiveAdmin.register Supply, { :sort_order => :name_asc } do
    menu false
    # Permitted parameters
    permit_params :title, :description

    # Displayed columns
    index do
    selectable_column
        column :title
        column :description
    actions
    end

    # Sidebar for Providers by this Supply
    sidebar 'Providers by this Supply', :only => :show do
        table_for Provider.joins(:supply).where(:supply_id => supply.id) do |s|
            s.column("Title") { |provider| provider.title }
        end
    end

    # Filters for title and description
    filter :title,         :as => :select               # :check_boxes (for checkboxes)
    filter :description,   :as => :select
end
