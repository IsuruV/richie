module Api::V1
    class GroupInvestmentsController < ApiController
        def create
            investment_request = GroupInvestmentRequest.create(group_investment_params)
            render json: investment_request
        end
        
    private
        def group_investment_params
            params.permit(:group_id, :etf_id, :description).merge(requester_id: current_user.id)
        end
    end
    
end
