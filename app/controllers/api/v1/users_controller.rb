module Api::V1
  class UsersController < ApiController
    before_filter :authenticate_user!, :except => [:create]
    
    # def create
    #   user = User.find_or_create_user_facebook(user_params)
    #   render json: { status: 200, user: user }
    # end
    
    def show
      render json: current_user, status: 200
    end
    
    def update
    end
    
    def index
      render json: User.all
    end
    
    def search
      users = User.name_search(user_search_params)
      render json: users
    end
  
  private
    def user_params
      params.require(:user).permit(:fd_id, :name, :email, :age, :image)
    end
    def user_search_params
      params.permit(:user_name)
    end
  end
end