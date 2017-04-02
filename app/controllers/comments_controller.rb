class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = find_comment
    comment.user_id = current_user.id

    unless comment.save
      flash["danger"] = "Problem: #{comment.errors.full_messages}"
    end
    redirect_to discussion_path(discussion_id)
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
end
