class AddColumnRequestedToGroupRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :group_requests, :requested, :boolean
  end
end
