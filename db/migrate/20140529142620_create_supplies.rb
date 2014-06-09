class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
