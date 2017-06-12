class GroupRequest < ActiveRecord::Base
    belongs_to :user
    belongs_to :group
    
    default_scope { where(approved: false) }
    
    def approve_request(request_params, current_user)
        group_request = GroupRequest.find(request_params)
        group = group_request.group
        user = group_request.user
          
        if current_user.in_all_groups?(group, as: 'admin')
            group_request.update(approved: true)
            group.add(user, as: 'member')
            group
        else
            'You aint an admin'
        end
    end
end