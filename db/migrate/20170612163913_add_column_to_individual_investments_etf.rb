class AddColumnToIndividualInvestmentsEtf < ActiveRecord::Migration[5.0]
  def change
    add_column :individual_investments, :etf_id, :integer
  end
end
