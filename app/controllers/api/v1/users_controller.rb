module Api::V1
  class UsersController < ApiController

      before_action :authenticate_user!, except: [:create]
      
    def create
        user = User.find_or_create_user_facebook(user_params)
        if user
          render status: 200, json: { message: 'user created or exists', status: 200 }
        else
          render status: 500, json: "error creating user"
        end
    end
    
    private
    def user_params
      params.require(:user).permit(:fd_id, :name, :email, :age, :image)
    end
    
  end
  
end