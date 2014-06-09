ActiveAdmin.register Job, { :sort_order => :name_asc } do
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

    # Sidebar for Staff Last, First and Middle name by this Job
    sidebar 'Staff by this Job', :only => :show do
        table_for Staff.joins(:job).where(:job_id => job.id) do |a|
            a.column("Last Name")   { |staff| staff.last_name }
            a.column("First Name")  { |staff| staff.first_name }
            a.column("Middle Name") { |staff| staff.middle_name }
        end
    end

    # Filters for title and description
    filter :title,         :as => :select   # :check_boxes (for checkboxes)
    filter :description,   :as => :select
end
