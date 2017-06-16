class AddColumnPublicToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :public, :boolean
  end
end
