class AddColumnCreatorIdToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :creator_id, :integer
  end
end
