class AddColumnBoughtPriceToGroupInvestments < ActiveRecord::Migration[5.0]
  def change
    add_column :group_investments, :bought_price, :decimal
    add_column :group_investments, :weight, :decimal
  end
end
