class NoticeChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "notice_channel_#{current_user.id}"
    # stream_from current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
