class AddColumnToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :group_requests, :minimum_amount, :decimal, :default => 0
  end
end
