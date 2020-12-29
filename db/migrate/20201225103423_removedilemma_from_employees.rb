class RemovedilemmaFromEmployees < ActiveRecord::Migration[6.0]
  def change
  	remove_column :employees, :dilemma
  end
end
