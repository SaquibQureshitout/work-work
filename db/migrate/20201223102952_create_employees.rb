class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :phone_num
      t.string :company
      t.string :designation

      t.timestamps
    end
  end
end
