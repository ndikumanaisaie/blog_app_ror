require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'Isaie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Web developer')
    @post = Post.create(title: 'post1', author: @user, text: 'first post')
  end

  it 'should call update_comments_counter after saving the comment' do
    expect(@post.comments_counter).to be 0

    comment = Comment.new(author: @user, post: @post, text: 'Hello rails')
    comment.save
    expect(@post.comments_counter).to be 1
  end
end
