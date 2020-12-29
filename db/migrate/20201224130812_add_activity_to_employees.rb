class AddActivityToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :activity, :boolean
    add_column :employees, :default, :true
  end
end
