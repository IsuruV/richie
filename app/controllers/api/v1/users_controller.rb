module Api::V1
  class UsersController < ApiController
      # before_action :authenticate_user!
    def create
       current_user = User.find_or_create(user_params)
    end
    
    def index
     
    end
  
    private
    def user_params
      params.require(:user).permit(:uid, :name, :email, :age, :image)
    end
    
  end
  
end