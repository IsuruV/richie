module Api::V1
  class UsersController < ApiController
  
    def search
      name = user_search_params[:input]
      users = User.name_search(name)
      render json: users, status: 200
    end
    
    def user
      render json: current_user, status: 200
    end
    
    def show
      user = User.find(find_user_params[:id])
      render json: user, status: 200
    end
    
    def update
    end
    
    def index
      render json: User.all
    end

  private
    def user_params
      params.require(:user).permit(:fd_id, :name, :email, :age, :image)
    end
    
    def user_search_params
      params.permit(:input)
    end
    
    def find_user_params
      params.permit(:id)
    end
    
  end
  
end