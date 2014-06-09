ActiveAdmin.register Staff, { :sort_order => :name_asc } do

    # Scopes
    scope :all, :default => true      # default scope display all staff members
    scope :Less_of_ten do |staff|     # less of ten display staff members with pay < x (10000 rub)
        staff.where('pay < ?', 10000)
    end
    scope :More_than_ten do |staff|   # more than ten display staff members with pay > x (10000 rub)
        staff.where('pay > ?', 10000)
    end

    # Permitted parameters
    permit_params :first_name, :last_name, :middle_name, :job_id, :phone, :pay, :start_at, :finish_at

    # Displayed columns
    index do
    selectable_column
        column :first_name,  :sortable => :first_name
        column :last_name,   :sortable => :last_name
        column :middle_name, :sortable => :middle_name
        column :job
    # Phone number helper
        column :phone do |tel|
            number_to_phone tel.phone, country_code: 7, area_code: true, delimiter: "-", raise: true
        end
    # Currency helper
        column :pay, :sortable => :pay do |mon|
            number_to_currency mon.pay, locale: :ru
        end
        column :start_at
        column :finish_at
        actions
    end

    # Filters for each column within "middle_name, phone"
    filter :first_name,  :as => :select               # :check_boxes (for checkboxes)
    filter :last_name,   :as => :select
    filter :job,         :as => :select
    filter :pay,         :as => :select
    filter :start_at,    :as => :select
    filter :finish_at,   :as => :select
end
