class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :article, index: true
      t.string :title
      t.text :description
      t.decimal :price
      t.boolean :featured
      t.date :available
      t.string :image_file_name

      t.timestamps
    end
  end
end
