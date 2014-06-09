ActiveAdmin.register Customer, { :sort_order => :name_asc } do

    # Scopes
    scope :all, :default => true
    scope :No_Discount do |discount|
      discount.where('discount_id = ?', 1)
    end
    scope :Five_percents do |discount|
      discount.where('discount_id = ?', 2)
    end
    scope :Ten_percents do |discount|
      discount.where('discount_id = ?', 3)
    end
    scope :Fifthteen_percents do |discount|
      discount.where('discount_id = ?', 4)
    end
    scope :Twenty_percents do |discount|
      discount.where('discount_id = ?', 5)
    end

    # Permitted parameters
    permit_params :first_name, :last_name, :middle_name, :phone, :email, :car, :discount_id

    # Displayed columns
    index do
    selectable_column
        column :first_name,  :sortable => :first_name
        column :last_name,   :sortable => :last_name
        column :middle_name, :sortable => :middle_name
    # Phone number helper
        column :phone do |tel|
            number_to_phone tel.phone, country_code: 7, area_code: true, delimiter: "-", raise: true
        end
        column :email do |mail|
          mail_to mail.email, mail.email
        end
        column :car
        column :discount do | dis |
          "#{dis.discount} %"
        end 
        actions
    end

    show do
      panel "Customer Details" do
        attributes_table_for customer do
          row("First Name")   { customer.first_name }
          row("Last Name")    { customer.last_name }
          row("Middle Name")  { customer.middle_name }
          row("Phone")        { number_to_phone customer.phone, country_code: 7, area_code: true, delimiter: "-", raise: true}
          row("Email")        { mail_to customer.email, customer.email }
          row("Car")          { customer.car }
          row("Discount")     { "#{customer.discount} %" }
        end
      end
    end

    # Filters for each column within "phone"
    filter :first_name,  :as => :select               # :check_boxes (for checkboxes)
    filter :last_name,   :as => :select
    filter :email,       :as => :select
    filter :car,         :as => :select
    filter :discount,    :as => :select 
end
