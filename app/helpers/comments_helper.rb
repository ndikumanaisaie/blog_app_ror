module CommentsHelper
  def any_comments?(post)
    !post.comments.empty?
  end
end
