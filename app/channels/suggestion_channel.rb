class SuggestionChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_suggestion_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_suggestion(data)
   
    group = Group.find_by(id: data['group_id'])
    etf_price = YahooApi.fetch_price(data['etf_symbol'])
    investment_request = GroupInvestmentRequest.create(requester: current_user, group_id: data['group_id'], etf_id: data['etf_id'])
    investment_request.create_approvers(group, current_user, data['amount'])
    
    ActionCable.server.broadcast "group_suggestion_#{data['group_id']}_channel",
      investment_request: investment_request,
      user: current_user
      
  end
  
  def delete_suggestion(data)
   
    investment_request = GroupInvestmentRequest.find_by(id: data['group_investment_request_id'])
    investment_request.delete
    
    ActionCable.server.broadcast "group_suggestion_#{data['group_id']}_channel",
      deleted_investment_request: investment_request
    
  end
  
  def approve_suggestion(data)
    investment_request = GroupInvestmentRequest.find_by(id: data['group_investment_request_id'])
    investment_request.approve(data['user_id'], data['approve_status'])
  
    ActionCable.server.broadcast "group_suggestion_#{data['group_id']}_channel",
      investment_request: investment_request
      
  end
  
  private
    def group_params
      params.permit(:group_id)
    end
    
end

