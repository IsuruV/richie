module Api::V1
    class GroupInvestmentsController < ApiController
        def create
            investment_request = GroupInvestmentRequest.create(group_investment_params)
            group = Group.find(group_investment_params[:group_id])
            investment_request.create_approvers(group)
            render json: investment_request
        end
        
        def approve
            investment_request = GroupInvestmentRequest.find(approve_params[:group_investment_request_id])
            investment_request.approve(approve_params)
            render json: investment_request
        end
        
    private
        def group_investment_params
            params.permit(:group_id, :etf_id, :description).merge(requester_id: current_user.id)
        end
        def approve_params
            params.permit(:group_investment_request_id, :user_id, :approve_status)
        end
    end
end
