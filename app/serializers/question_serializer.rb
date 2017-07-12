class QuestionSerializer < ActiveModel::Serializer
    attributes :question, :choices
    has_many :choices
end