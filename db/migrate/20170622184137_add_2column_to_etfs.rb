class Add2columnToEtfs < ActiveRecord::Migration[5.0]
  def change
    add_column :etfs, :name, :string
    add_column :etfs, :fiduty_name, :string
  end
end
