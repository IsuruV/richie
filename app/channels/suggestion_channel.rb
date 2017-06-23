class SuggestionChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_suggestion_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_suggestion(data)
    user = User.find_by(id: data['user_id'])
    group = Group.find_by(id: data['group_id'])
    etf_price = YahooApi.fetch_price(data['etf'])
    investment_request = GroupInvestmentRequest.create(requester: user, group_id: data['group_id'], etf_id: data['etf_id'])
    investment_request.create_approvers(group)
    
    ActionCable.server.broadcast "group_suggestion_#{data['group_id']}_channel",
      investment_request: investment_request,
      user: user
      
  end
  
  def delete_suggestion(data)
    user = User.find_by(id: data['user_id'])
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
  
end


    # user = User.find_by(id: data['user_id'])
    # suggestion = user.suggestions.new(etf_id: data['etf_id'], group_id: data['group_id'])
    # etf_price = YahooApi.fetch_price(suggestion.etf.ticker)
    # if suggestion.save
    #   ActionCable.server.broadcast "group_chats_#{data['group_id']}_channel",
    #   group_id: suggestion.group_id,
    #   etf: suggestion.etf,
    #   last_price: etf_price,
    #   user: suggestion.user
    # end