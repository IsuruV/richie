class CreateIndividualInvestments < ActiveRecord::Migration
  def change
    create_table :individual_investments do |t|

      t.timestamps null: false
    end
  end
end
