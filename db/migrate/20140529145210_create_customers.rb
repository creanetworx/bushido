class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :phone
      t.string :email
      t.string :car
      t.references :discount, index: true

      t.timestamps
    end
  end
end
