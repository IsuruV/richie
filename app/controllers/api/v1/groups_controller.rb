module Api::V1
  class GroupsController < ApiController
    
    def create
        group = Group.create(create_group_params)
        group.add(current_user, as: 'admin')
        render json: group
    end
    
    def update
        group = Group.find(id: group_params[:group_id])
        group.update(name: group_params[:name])
        render json: group
    end
    
    def index
        render json: current_user.groups
    end
    
    def destroy
        group = Group.find(id: group_params[:group_id])
        if check_if_group_admin(group)
            group.delete
            render json: "#{group.name} deleted"
        else
            render json: "You do not have the access rights"
        end
    end
    
    private
    
    def group_params
        params.permit(:name, :group_id)
    end
    
    def create_group_params
        params.permit(:name, :description)
    end
    
  end
end
