ActiveAdmin.register Article, { :sort_order => :name_asc } do
    menu false
    # Permitted parameters
    permit_params :title, :description, :rub

    # Displayed columns
    index do
    selectable_column
        column :title
        column :description
    actions
    end

    # Sidebar for Products by this Article
    sidebar 'Products by this Article', :only => :show do
        table_for Product.joins(:article).where(:article_id => article.id) do |a|
            a.column("Title") { |product| product.title }
        end
    end

    # Filters for title and description
    filter :title,         :as => :select               # :check_boxes (for checkboxes)
    filter :description,   :as => :select
end
