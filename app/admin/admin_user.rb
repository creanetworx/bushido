ActiveAdmin.register AdminUser, :as => "Manager" do

    # Permitted parameters
    permit_params :email, :password, :password_confirmation

    # Displayed columns
    index do
        selectable_column
        id_column
        column :email
        column :current_sign_in_at
        column :last_sign_in_at
        column :sign_in_count
        column :created_at
        actions
    end

    # Filters for email, currentSignInAt, lastSignInAt, signInCount, createdAt
    filter :email
    filter :current_sign_in_at
    filter :last_sign_in_at
    filter :sign_in_count
    filter :created_at

    # Form for Admin Details
    form do |f|
        f.inputs "Admin Details" do
            f.input :email
            f.input :password
            f.input :password_confirmation
        end
        f.actions
    end
end
