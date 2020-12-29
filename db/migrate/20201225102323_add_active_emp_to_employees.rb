class AddActiveEmpToEmployees < ActiveRecord::Migration[6.0]
  def change

    add_column :employees, :delimma, :string, :default => "WFH"
   
  end
end
