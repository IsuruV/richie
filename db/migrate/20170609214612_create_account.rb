class CreateAccount < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.numeric :amount
      t.string :bank_number
      t.string :routing_number
    end
  end
end
