ActiveAdmin.register Provider, { :sort_order => :name_asc } do

    # Scopes
    scope :all, :default => true
    scope :Shipping do |shipping|
        shipping.where(:shipping => true)
    end

    # Permitted parameters
    permit_params :title, :supply_id, :web_site, :phone, :email, :open_at, :closed_at, :shipping, :address

    # Displayed columns
    index do
    selectable_column
        column :title,  :sortable => :title
        column :supply, :sortable => :supply
        column :web_site
    # Phone number helper
        column :phone do |tel|
            number_to_phone tel.phone, country_code: 7, area_code: true, delimiter: "-", raise: true
        end
        column :email
        column :open_at
        column :closed_at
        column :address
        column :shipping
        actions
    end

    # Provider details
    show do
      panel "Provider Details" do
        attributes_table_for provider do
          row("Title")        { provider.title }
          row("Supply")       { link_to provider.supply.title }
          row("Web Site")     { provider.web_site }
          row("Phone")        { provider.phone }
          row("Email")        { provider.email }
          row("Open Hours")   { provider.open_at }
          row("Closed Hours") { provider.closed_at }
          row("Address")      { provider.address }
          row("Shipping")     { status_tag (provider.shipping ? "Yes" : "No"), (provider.shipping ? :ok : :error) }
        end
      end
    end

    # Filters for each column within "web_site, phone, "
    filter :title,      :as => :select               # :check_boxes (for checkboxes)
    filter :supply,     :as => :select
    filter :email,      :as => :select
    filter :open_at
    filter :closed_at
    filter :address,    :as => :select
    filter :shipping,   :as => :check_boxes
end
