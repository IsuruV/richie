class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :fd_id, :string
  end
end
