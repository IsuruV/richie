class AddColumnToIndividualInvestments < ActiveRecord::Migration[5.0]
  def change
    add_column :individual_investments, :user_id, :integer
  end
end
