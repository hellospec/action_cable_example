class DiscussionsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @discussions = Discussion.all.order(created_at: :desc)
  end

  def new
    @discussion = Discussion.new
  end

  def show
    find_discussion
  end

  def create
    @discussion = Discussion.new(discussion_params)
    if @discussion.save
      flash[:success] = "New Discussion has been created"
      redirect_to discussions_path 
    else
      flash[:danger] = "Not able to create Discussion. Pls try again."
      render "new"
    end
  end

  private
  def discussion_params
    params.require(:discussion).permit(:topic)
  end

  def find_discussion
    @discussion = Discussion.find(params[:id])
  end
end
