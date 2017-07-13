class ChangeColumnChoiceType < ActiveRecord::Migration[5.0]
  def change
    remove_column :choices, :choice
    add_column :choices, :choice, :string
  end
end
