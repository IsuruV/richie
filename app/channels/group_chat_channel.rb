class GroupChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_chats_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    user = current_user
    
    message = user.messages.new(content: data['content'], group_id: data['group_id'])
    if message.save
      ActionCable.server.broadcast "group_chats_#{data['group_id']}_channel",
      group_id: message.group_id,
      message: message,
      user: message.user
    end
  end
  
  def online(data)
    user = current_user
    
    ActionCable.server.broadcast "group_chats_#{data['group_id']}_channel",
    user: user
  end
  
end