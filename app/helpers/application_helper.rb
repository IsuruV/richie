module ApplicationHelper

    def check_if_group_admin(group)
        current_user.in_all_groups?(group, as: 'admin')
    end
    
    def find_group(group_params)
        Group.find(group_params[:id])
    end

end
