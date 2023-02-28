class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:id], author_id: current_user.id)
    @post = Post.find(params[:post_id])
    if @like.save
      redirect_to user_post_path(params[:user_id], params[:id])
    else
      flash[:error] = @like.errors.full_messages.join(', ')
      redirect_back(fallback_location: root_path)
    end
  end
end
