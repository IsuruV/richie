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
            'You do not have admin privileges'
        end
    end
    
    def create_request(request_params, current_user, group)
        self.create(group_id: request_params[:group_id], 
                                                    user_id: request_params[:user_id],
                                                    message: "#{current_user.name} send you a request to join #{group.name}",
                                                    requested: false)
    end
end