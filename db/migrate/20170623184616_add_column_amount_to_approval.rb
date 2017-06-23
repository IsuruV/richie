class AddColumnAmountToApproval < ActiveRecord::Migration[5.0]
  def change
    add_column :approvers, :amount, :decimal
  end
end
