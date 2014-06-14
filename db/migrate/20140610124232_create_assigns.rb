class CreateAssigns < ActiveRecord::Migration
  def change
    create_table :assigns do |t|
      t.integer :customer_id
      t.integer :staff_id
      t.integer :discount_id

      t.timestamps
    end
  end
end
