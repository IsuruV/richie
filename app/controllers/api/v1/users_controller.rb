module Api::V1
  class UsersController < ApiController
      before_action :authenticate_user!, except: [:create]
      
    def create
        user_params[:password] = user_params[:fd_id]
        user = User.find_or_create_user_facebook(user_params)
        if user
          render status: 200, json: "user found or created"
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