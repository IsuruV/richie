class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :group_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
