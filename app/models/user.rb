class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes

  validates :name, presence: true
  validates :post_counter presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  def recent_posts
    posts.last(3)
  end
end
