class Post < ApplicationRecord
  has_many :comments
  has_many :likes

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_post_counter

  def recent_comments
    Comment.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.increment!(:post_counter)
  end
end
