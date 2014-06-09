ActiveAdmin.register Activity, { :sort_order => :name_asc } do
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

    # Sidebar for Partners by this Activity
    sidebar 'Partners by this Activity', :only => :show do
        table_for Partner.joins(:activity).where(:activity_id => activity.id) do |a|
            a.column("Title") { |partner| partner.title }
        end
    end

    # Filters for title and description
    filter :title,         :as => :select               # :check_boxes (for checkboxes)
    filter :description,   :as => :select
end
