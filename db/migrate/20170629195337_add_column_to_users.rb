class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :amount, :decimal
  end
end
