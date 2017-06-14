module Api::V1
  class UsersController < ApiController
  
    def search
      users = User.name_search(user_search_params)
      render json: users, status: 200
    end
    
    def show
      render json: current_user, status: 200
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
  end
  
end