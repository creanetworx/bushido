class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :title
      t.references :supply, index: true
      t.string :web_site
      t.integer :phone
      t.string :email
      t.string :open_at
      t.string :closed_at
      t.boolean :shipping
      t.string :address

      t.timestamps
    end
  end
end
