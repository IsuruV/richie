class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|

      t.timestamps null: false
    end
  end
end
