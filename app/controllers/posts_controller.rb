class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments, :likes).all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
