class CreateGroupInvestments < ActiveRecord::Migration
  def change
    create_table :group_investments do |t|
      t.integer :suggestion_id
      t.integer :group_id
      t.timestamps null: false
    end
  end
end
