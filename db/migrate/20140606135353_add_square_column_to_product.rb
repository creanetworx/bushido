class AddSquareColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :square, :string
  end
end
