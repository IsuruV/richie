class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :following, null: false
      t.belongs_to :follower, null: false
      
      t.timestamps null: false
    end
  end
end
