class CreateUserChoiceQuestion < ActiveRecord::Migration[5.0]
  def change
    create_table :user_choice_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :choice_id
      t.string :open_ended
    end
  end
end
