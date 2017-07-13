class Choice < ActiveRecord::Base
    belongs_to :question
    has_many :user_choice_questions
    has_many :users, :through => :user_choice_questions
end
