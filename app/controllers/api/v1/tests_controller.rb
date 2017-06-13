  module Api::V1
  class TestsController < ApiController

    def index
        render json: 'works'
    end
    
    def user
      render json: User.all.first, status: 200
    end
end
end