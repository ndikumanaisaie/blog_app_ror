class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes

  def recent_posts
    posts.order_by(created_at:, :desc).limit(3)
  end
end
