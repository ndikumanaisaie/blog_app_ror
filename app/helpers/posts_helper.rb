module PostsHelper
  def no_posts?(user_posts)
    user_posts.empty?
  end
end
