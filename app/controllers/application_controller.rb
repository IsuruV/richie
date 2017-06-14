class ApplicationController < ActionController::Base
    include ApplicationHelper
    
    def create
      
       user = User.find_or_create_user_facebook(user_params)
       render json: { status: 200, user: user }
    end
    
  private
    def user_params
      params.require(:user).permit(:fd_id, :name, :email, :age, :image)
    end
end
