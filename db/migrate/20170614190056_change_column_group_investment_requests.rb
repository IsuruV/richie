class ChangeColumnGroupInvestmentRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :group_investment_requests, :approver_id
    add_column :approvers, :group_investment_request_id, :integer
  end
end
