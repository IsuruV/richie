class GroupInvestmentRequest < ApplicationRecord
    belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
    has_many :approvers
    
    def create_approvers(group)
        group.each do |group_member|
            
        end
    end
end
