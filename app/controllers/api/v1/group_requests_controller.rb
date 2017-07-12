module Api::V1
  class GroupRequestsController < ApiController
      
      def create
          group_request = GroupRequest.create(user: current_user, group: membership_params[:group_id], 
                                            message: membership_params[:message], requested: true)
          render json: group_request
      end
      
      def update
        minimum = request_params[:minimum].to_i
          approval = GroupRequest.approve_request(request_params[:id], request_params[:approve], minimum)
          render json: approval
      end

      private
        def membership_params
            params.permit(:group_id, :message)
        end
        
        def request_params
            params.permit(:id, :approve)
        end
  end
  
end