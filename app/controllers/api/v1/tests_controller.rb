  module Api::V1
    
  class TestsController < ApiController
    before_filter :authenticate_user!
    def index
        render json: 'works'
    end
    
    def user
      user = current_user
      render json: user.to_json, status: 200
    end
    
  end
  
end