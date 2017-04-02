class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
   stream_from "comment_channel_#{params[:discussion_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
