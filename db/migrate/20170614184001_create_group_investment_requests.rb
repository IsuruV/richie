class CreateGroupInvestmentRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :group_investment_requests do |t|
      t.integer :requester_id
      t.integer :approver_id
      t.integer :group_id
      t.integer :etf_id
      t.string :description
      t.timestamps
    end
  end
end
