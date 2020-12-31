class ChangePasswordToBeDigestInEmployees < ActiveRecord::Migration[6.0]
  def change
  	 change_column :employees, :password, :digest
  end
end
