class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def recent_comments
    Comment.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.increment!(:post_counter)
  end
end
