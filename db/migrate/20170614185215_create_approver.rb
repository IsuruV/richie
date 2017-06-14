class CreateApprover < ActiveRecord::Migration[5.0]
  def change
    create_table :approvers do |t|
      t.integer :user_id
      t.string :message
    end
  end
end
