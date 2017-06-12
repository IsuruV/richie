class AddColumnToSuggestions < ActiveRecord::Migration[5.0]
  def change
    add_column :suggestions, :etf_id, :integer
  end
end
