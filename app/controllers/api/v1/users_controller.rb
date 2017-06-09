module Api::V1
  class UsersController < ApiController
      # before_action :authenticate_user!
    def create
       user = User.find_or_create_user_facebook(user_params)
       render json: { status: 200, user: user }
    end
    
    def show
      render json: current_user
    end
  
    private
    def user_params
      params.require(:user).permit(:fd_id, :name, :email, :age, :image)
    end
    
  end
  
end