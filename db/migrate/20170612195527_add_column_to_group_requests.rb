class AddColumnToGroupRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :group_requests, :approved, :boolean
  end
end
