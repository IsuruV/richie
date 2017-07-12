class ApproverSerializer < ActiveModel::Serializer
  attributes :id, :message, :approved, :group_investment_request_id, :amount, :user
  
  belongs_to :user
end