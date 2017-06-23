class GroupInvestmentRequestSerializer < ActiveModel::Serializer
  attributes :id, :approvers, :group_investment, :requester
  
    has_many :approvers
    has_one :group_investment
    has_one :requester, foreign_key: :requester_id, class_name: 'User'
    
end
