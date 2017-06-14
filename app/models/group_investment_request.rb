class GroupInvestmentRequest < ApplicationRecord
    belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
    has_many :approvers
end
