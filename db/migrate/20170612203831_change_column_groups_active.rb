class ChangeColumnGroupsActive < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :active
    add_column :groups, :active, :boolean, :default => true
  end
end
