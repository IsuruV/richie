class GroupInvestmentRequest < ApplicationRecord
    belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
    has_many :approvers
    
    def create_approvers(group)
        group.members.each do |group_member|
            self.approvers.create(user_id: group_member.id, approved: false)
        end
    end
    
    def approve(user_id)
        approved_request = self.approvers.find_by(user_id: user_id)
        approved_request.update(approved: true)
        self.approve_confirmed
    end
    
    def approve_confirmed
        confirmation = self.approvers.all? { |x| x == self.approvers[0] }
        if confirmation
            ## create transaction
        end
    end
end
