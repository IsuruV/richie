class GroupInvestmentRequestSerializer < ActiveModel::Serializer
  attributes :id, :approvers, :group_investment, :requester, :etf, :group
  
    has_many :approvers
    has_one :group_investment
    has_one :requester, foreign_key: :requester_id, class_name: 'User'
    has_one :group
    
    def etf
      object.etf
    end
    
    def requester
      object.requester_serializer
    end
    
    
end
