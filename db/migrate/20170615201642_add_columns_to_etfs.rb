class AddColumnsToEtfs < ActiveRecord::Migration[5.0]
  def change
    add_column :etfs, :risk_level, :string
    add_column :etfs, :holdings, :string
    add_column :etfs, :investment_name, :string
    add_column :etfs, :ticker, :string
    add_column :etfs, :last_price, :string
    add_column :etfs, :dividend_yield, :string
    add_column :etfs, :expense_ratio, :string
    add_column :etfs, :website_link, :string
  end
end
