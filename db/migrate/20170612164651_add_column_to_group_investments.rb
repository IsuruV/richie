class AddColumnToGroupInvestments < ActiveRecord::Migration[5.0]
  def change
    add_column :group_investments, :etf_id, :integer
    remove_column :group_investments, :suggestion_id
  end
end
