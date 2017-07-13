class Question < ActiveRecord::Base
    has_many :choices
    has_many :user_choice_questions
    has_many :users, :through => :user_choice_questions
end
