class GroupRequest < ActiveRecord::Base
    belongs_to :user
    belongs_to :group
    
    default_scope { where(approved: false) }
    
    def approve_request(request_params)
        group_request = GroupRequest.find(request_params)
        group = group_request.group
        user = group_request.user
          
        if check_if_group_admin(group)
            group_request.update(approved: true)
            group.add(user, as: 'member')
            group
        else
            'You aint an admin'
        end
    end
end