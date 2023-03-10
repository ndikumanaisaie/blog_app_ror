class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_id: params[:id], author_id: current_user.id, text: params[:text])
    if @comment.save
      @comment.update_comments_counter
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'An error has occurred, please try again later'
    end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end
