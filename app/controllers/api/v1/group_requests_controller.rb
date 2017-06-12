module Api::V1
  class GroupRequestsController < ApiController
      
      def create
          group_request = GroupRequest.create(user: current_user, group: membership_params[:group_id], 
                                            message: membership_params[:message])
          render json: group_request
      end
      
      def update
          approval = GroupRequest.approve_request(request_params)
          render json: approval
      end
      
      def index
          
      end
      
      private
        def membership_params
            params.permit(:group_id, :message)
        end
        
        def request_params
            params.permit(:group_request_id)
        end
  end
  
end