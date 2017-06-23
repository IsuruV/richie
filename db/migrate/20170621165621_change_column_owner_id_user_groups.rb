class ChangeColumnOwnerIdUserGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_groups, :owner_id
    add_column :user_groups, :memeber_type, :string
  end
end
