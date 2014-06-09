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
        column :web_site do | website|
          link_to website.web_site, website.web_site, :target => "_blank"
        end
    # Phone number helper
        column :phone do |tel|
            number_to_phone tel.phone, country_code: 7, area_code: true, delimiter: "-", raise: true
        end
        column :email do | mail |
          mail_to mail.email, mail.email
        end
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
          row("Web Site")     { link_to provider.web_site, provider.web_site, :target => "_blank" }
          row("Phone")        { number_to_phone provider.phone, country_code: 7, area_code: true, delimiter: "-", raise: true}
          row("Email")        { mail_to provider.email, provider.email }
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
