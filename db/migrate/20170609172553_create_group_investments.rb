class CreateGroupInvestments < ActiveRecord::Migration
  def change
    create_table :group_investments do |t|

      t.timestamps null: false
    end
  end
end
