class ChangePasswordToBeStringInEmployees < ActiveRecord::Migration[6.0]
  def change
  	 change_column :employees, :password, :string
  end
end
