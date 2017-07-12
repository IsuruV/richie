module Api::V1
    class SuggestionsController < ApiController
        
        def create
           group = Group.find_by(id: params[:suggestion][:groupId])
           etf_price = YahooApi.fetch_price(params[:suggestion][:ticker])[:last_trade_price]
           investment_request = GroupInvestmentRequest.create(requester: current_user, group_id: params[:suggestion]['groupId'], etf_id: params[:suggestion]['etfId'])
           investment_request.create_approvers(group, current_user, params[:suggestion][:amount])
           render json: investment_request
        end
    
        private
            def suggestion_params
                params.permit(:suggestion)
            end
    end
end
