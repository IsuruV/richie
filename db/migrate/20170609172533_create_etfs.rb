class CreateEtfs < ActiveRecord::Migration
  def change
    create_table :etfs do |t|

      t.timestamps null: false
    end
  end
end
