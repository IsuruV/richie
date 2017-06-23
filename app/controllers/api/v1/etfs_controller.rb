module Api::V1
    class EtfsController < ApiController
        
        def index
            render json: Etf.all
        end
        
    end
end
