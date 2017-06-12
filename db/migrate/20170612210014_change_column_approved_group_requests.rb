class ChangeColumnApprovedGroupRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :group_requests, :approved
    add_column :group_requests, :approved, :boolean,  :default => false
  end
end
