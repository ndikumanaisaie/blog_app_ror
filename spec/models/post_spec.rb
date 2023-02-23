require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations for the post model' do
    before(:each) do
      @user = User.new(name: 'Isaie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'software engineer', post_counter: 2)
      @post = Post.new(author: @user, title: 'Test', text: 'testing', likes_counter: 4, comments_counter: 5)
    end

    it 'Title should be present' do
      @post.title = true
      expect(@post).to be_valid
    end

    it 'There should be max 250 characters' do
      @post.title = 'Testing'
      expect(@post).to be_valid
    end

    it 'likes_counter should be integer' do
      @post.likes_counter = 2
      expect(@post).to be_valid
    end

    it 'likes_counter should be greater than or equal to zero' do
      @post.likes_counter = -9
      expect(@post).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to zero.' do
      @post.comments_counter = -5
      expect(@post).to_not be_valid
    end

    it 'comments_counter should be an integer' do
      @post.comments_counter = 8
      expect(@post).to be_valid
    end

    describe 'Should test recent_comments method in post model' do
      it 'Should show five recent comments' do
        expect(@post.recent_comments).to eq(@post.comments.last(5))
      end
    end
  end
end