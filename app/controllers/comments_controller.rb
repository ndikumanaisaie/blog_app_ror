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
    redirect_to user_post_path(@comment.post.author, @comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.update_comments_counter
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end
end
