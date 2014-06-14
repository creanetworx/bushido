class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.integer :staff_id
      t.integer :admin_user_id
      t.integer :discount_id
      t.timestamps
    end
  end
end
