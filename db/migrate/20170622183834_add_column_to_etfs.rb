class AddColumnToEtfs < ActiveRecord::Migration[5.0]
  def change
    add_column :etfs, :description, :text
  end
end
