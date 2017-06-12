module Api::V1
  class GroupsController < ApiController
    
    def create
        group = Group.create(create_group_params)
        group.add(current_user, as: 'admin')
        render json: group
    end
    
    def update
        group = find_group(group_params)
        group.update(name: group_params[:name], description: group_params[:description])
        render json: group
    end
    
    def index
        render json: current_user.groups
    end
    
    def destroy
        group = find_group(group_params)
        if check_if_group_admin(group)
            group.delete
            render json: "#{group.name} deleted".to_json
        else
            render json: "You do not have the access rights".to_json
        end
    end
    
    private
    
    def group_params
        params.permit(:id, :name, :description)
    end
    
    def create_group_params
        params.permit(:name, :description)
    end
    
  end
end
