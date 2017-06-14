module Api::V1
    class GroupInvestmentsController < ApiController
        def create
            
        end
        
    private
        def group_investment_params
            params.permit(:request)
        end
    end
end
