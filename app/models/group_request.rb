class GroupRequest < ActiveRecord::Base
    belongs_to :user
    belongs_to :group
    
    default_scope { where(approved: false) }
    
    def self.approve_request(request_id, approved)
        group_request = self.find_by(id: request_id)
        if approved
            group_request.approve_single_request
            group = group_request.group
            user = group_request.user
            group.add_member(user)
        else
            group_request.disapprove_single_request
        end
    end
    
    def approve_single_request
        self.update(approved: true)
    end
    
    def disapprove_single_request
        self.delete
    end
    
end