class AddColumnToGroupsInvestments < ActiveRecord::Migration[5.0]
  def change
    add_column :group_investments, :group_amount, :decimal
  end
end
