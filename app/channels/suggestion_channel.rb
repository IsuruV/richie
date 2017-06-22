class SuggestionChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_chats_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_suggestion(data)
    # require 'pry'; binding.pry
    user = User.find_by(id: data['user_id'])
    suggestion = user.suggestions.new(etf_id: data['etf_id'], group_id: data['group_id'])
    etf_price = YahooApi.fetch_price(suggestion.etf.ticker)
    if suggestion.save
      ActionCable.server.broadcast "group_chats_#{data['group_id']}_channel",
      group_id: suggestion.group_id,
      etf: suggestion.etf,
      last_price: etf_price,
      user: suggestion.user
    end
  end
  
end