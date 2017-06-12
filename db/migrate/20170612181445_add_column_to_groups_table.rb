class AddColumnToGroupsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :name, :string
    add_column :groups, :description, :string
  end
end
