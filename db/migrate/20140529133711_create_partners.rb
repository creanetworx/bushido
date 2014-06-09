class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :title
      t.references :activity, index: true
      t.string :web_site
      t.string :contact
      t.integer :phone
      t.string :email
      t.string :address
      t.references :admin_user, index: true
      t.boolean :is_new
      t.boolean :is_current
      t.boolean :is_denied

      t.timestamps
    end
  end
end
