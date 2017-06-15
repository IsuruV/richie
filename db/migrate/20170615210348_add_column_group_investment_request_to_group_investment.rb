class AddColumnGroupInvestmentRequestToGroupInvestment < ActiveRecord::Migration[5.0]
  def change
    add_column :group_investments, :group_investment_request_id, :integer
  end
end
