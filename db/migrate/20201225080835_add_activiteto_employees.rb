class AddActivitetoEmployees < ActiveRecord::Migration[6.0]
  
  def change
  	add_column :employees, :activite, :boolean, :default => true
  end
  end
end
