require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Isaie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Web developer')
    @post = Post.create(title: 'post1', author: @user)
  end

  it 'should call update_likes_counter after saving the likes' do
    expect(@post.likes_counter).to be 0

    like1 = Like.new(author: @user, post: @post)
    like2 = Like.new(author: @user, post: @post)
    like1.save
    like2.save
    expect(@post.likes_counter).to be 2
  end
end
