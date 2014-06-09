class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.references :job, index: true
      t.integer :phone
      t.decimal :pay
      t.string :start_at
      t.string :finish_at

      t.timestamps
    end
  end
end
