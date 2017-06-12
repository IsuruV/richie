class ChangeTableGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :creator_id, :integer
    add_column :groups, :description, :string
    
    add_column :user_groups, :owner_id, :integer
  end
end
