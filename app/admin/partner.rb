ActiveAdmin.register Partner, { :sort_order => :name_asc } do

    # Scopes
    scope :all, :default => true
    scope :New do |new|
        new.where(:is_new => true)
    end
    scope :Current do |current|
        current.where(:is_current => true)
    end
    scope :Denied do |denied|
        denied.where(:is_denied => true)
    end

    # Permitted parameters
    permit_params :title, :activity_id, :web_site, :contact, :phone, :email, :address, :admin_user_id, :is_new, :is_current, :is_denied

    # Displayed columns
    index do
    selectable_column
        column :title,    :sortable => :title
        column :activity, :sortable => :activity
        column :web_site
        column :contact
    # Phone number helper
        column :phone do |tel|
            number_to_phone tel.phone, country_code: 7, area_code: true, delimiter: "-", raise: true
        end
        column :email
        column :address
        column :admin_user
        column :is_new
        column :is_current
        column :is_denied
        actions
    end

    # Provider details
    show do
        panel "Partner Details" do
            attributes_table_for partner do
                row("Title")             { partner.title }
                row("Type of Activity")  { link_to partner.activity }
                row("Web Site")          { partner.web_site }
                row("Contact Person")    { partner.contact }
                row("Phone")             { partner.phone }
                row("Email")             { partner.email }
                row("Address")           { partner.address }
                row("Admin User")        { link_to partner.admin_user }
                row("New Partner")       { status_tag (partner.is_new ? "New" : "Pending"), (partner.is_new ? :ok : :error) }
                row("Current Partner")   { status_tag (partner.is_current ? "Current" : "Pending"), (partner.is_current ? :ok : :error) }
                row("Denied Partner")    { status_tag (partner.is_denied ? "Denied" : "Pending"), (partner.is_denied ? :ok : :error) }
            end
        end
    end

    # Filters for each column within "web_site, phone, address"
    filter :title,        :as => :select               # :check_boxes (for checkboxes)
    filter :activity,     :as => :select
    filter :email,        :as => :select
    filter :admin_user,   :as => :select
    filter :is_new,       :as => :check_boxes
    filter :is_current,   :as => :check_boxes
    filter :is_denied,    :as => :check_boxes
end
