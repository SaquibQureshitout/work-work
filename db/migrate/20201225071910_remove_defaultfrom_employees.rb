class RemoveDefaultfromEmployees < ActiveRecord::Migration[6.0]
  
  def change
  	remove_column :employees, :default, :true
  end
end
