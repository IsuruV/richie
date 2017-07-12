class AddColumnToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :user_groups, :deposited_amount, :decimal, :default => 0
    add_column :groups, :minimum_amount, :decimal
  end
end
