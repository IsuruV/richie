class GroupChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end
  
  # def subscribed
  #   stream_from "room-#{params['classroom_id']}"
  # end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  # def speak(data) 
  #   ActionCable.server.broadcast "messages", message: data['message'] 
  # end
  
  def speak(data)

  end
end