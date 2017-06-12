class CreateTableGroupRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :table_group_requests do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :message
    end
  end
end
