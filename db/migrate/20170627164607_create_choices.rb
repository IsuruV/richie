class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.integer :choice
    end
  end
end
