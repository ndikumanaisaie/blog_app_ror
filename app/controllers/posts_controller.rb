class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments, :likes).all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if params[:title].blank? || params[:text].blank?
      flash[:error] = 'Title and text fields are required'
      redirect_back(fallback_location: root_path)
      return
    end
    @post = Post.new(title: params[:post][:title], text: params[:post][:text], author_id: current_user.id)
    if @post.save
      redirect_to user_post_path(@post), notice: 'Post created successfully'
    else
      render :new, alert: 'An error occured. Please try again!'
    end
  end
end
