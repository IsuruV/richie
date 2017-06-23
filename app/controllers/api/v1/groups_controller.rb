module Api::V1
  class GroupsController < ApiController
    
    
    def create
        group = Group.create_group(create_group_params, params, current_user)
        render json: group
    end
    
    def show
        render json: Group.find(params[:id])
    end
    
    def update
        group = find_group(group_params)
        group.update(name: group_params[:name], description: group_params[:description])
        render json: group
    end
     
    ## send join group request to fb friends
    def send_request
        user_tokens = request_params[:access_tokens]
        group = Group.find_by(id: request_params[:group_id])
        join_requests = []
        user_tokens.each do |token|
            friend = User.find_by(access_token: token)
            join_requests << friend.group_requests.create_request(request_params, current_user, group)
        end
        render json: join_requests
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
        params.permit(:name, :description, :public)
    end
    
    def request_params
        params.permit(:access_tokens, :group_id)
    end
    
  end
end
