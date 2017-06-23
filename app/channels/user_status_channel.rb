class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_user_status_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
end