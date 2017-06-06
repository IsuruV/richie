module Api::V1
  class TestsController < ApiController

    def index
        render json: 'works'
    end

  end
end