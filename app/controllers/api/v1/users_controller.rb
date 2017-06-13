module Api::V1
  class UsersController < ApiController
         include DeviseTokenAuth::Concerns::SetUserByToken
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      # protect_from_forgery with: :exception
      protect_from_forgery with: :null_session
      before_filter :authenticate_user!, :except => [:create]
      
    def create
       user = User.find_or_create_user_facebook(user_params)
       render json: { status: 200, user: user }
    end
    
    def show
      # require 'pry'; binding.pry
      render json: current_user, status: 200
    end
    
    def update
    end
  
  # private
    def user_params
      params.require(:user).permit(:fd_id, :name, :email, :age, :image)
    end
  
  end
  
end