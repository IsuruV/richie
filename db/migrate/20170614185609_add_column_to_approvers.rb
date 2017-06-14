class AddColumnToApprovers < ActiveRecord::Migration[5.0]
  def change
    add_column :approvers, :approved, :boolean
  end
end
