class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = find_comment
    @comment.user_id = current_user.id

    if @comment.save
      ActionCable.server.broadcast "comment_channel_#{@comment.discussion_id}", 
        content: render_comment
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def discussion_id
    params[:discussion_id]
  end

  def find_comment
    Discussion.find(discussion_id).comments.new(comment_params)
  end

  def render_comment
    render partial: "comments/comment", locals: { comment: @comment }
  end
end
