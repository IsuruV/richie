class DropTableGroupRequests < ActiveRecord::Migration[5.0]
  def change
    drop_table :table_group_requests
    
    create_table :group_requests do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :message
      t.timestamps null: false
    end
    
  end
end
