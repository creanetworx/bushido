ActiveAdmin.register Discount, { :sort_order => :name_asc } do
    menu false
    # Permitted parameters
    permit_params :discount

    # Displayed columns
    index do
    selectable_column
    # Percentage helper
        column :discount, :sortable => :discount do |perc|
            number_to_percentage perc.discount, precision: 0
        end
    actions
    end

    # Sidebar for Customers by this Discount
    sidebar 'Customers by this Discount', :only => :show do
        table_for Customer.joins(:discount).where(:discount_id => discount.id) do |d|
            d.column("Email")       { |customer| customer.email }
            d.column("Last Name")   { |customer| customer.last_name }
            d.column("First Name")  { |customer| customer.first_name }
            d.column("Middle Name") { |customer| customer.middle_name }
        end
    end

    # Filter for discount
    filter :discount, :as => :select
end
