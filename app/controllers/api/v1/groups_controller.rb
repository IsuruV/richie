module Api::V1
  class GroupsController < ApiController
    
    def create
        group = Group.create(creator_id: current_user.id, name: group_params[:name])
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
        group.delete
        render json: group
    end
    
    private
    
    def group_params
        params.permit(:name, :group_id)
    end
    
  end
end
