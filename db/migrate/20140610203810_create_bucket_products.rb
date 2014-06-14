class CreateBucketProducts < ActiveRecord::Migration
  def change
    create_table :bucket_products do |t|
      t.integer :bucket_id
      t.string :bucket_type
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
