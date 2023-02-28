class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_id: params[:id], author_id: current_user.id, text: params[:text])
    if @comment.save
      @comment.update_comments_counter
    else
      flash[:error] = 'There is an error'
    end
    redirect_to user_post_path(params[:user_id], params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.update_comments_counter
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end
end
