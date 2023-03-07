require 'rails_helper'

RSpec.describe 'post#show', type: :feature do
  describe 'post show page' do
    before(:each) do
      @user = User.create(name: 'isaie', photo: 'isaie.png', bio: 'Lorem.', post_counter: 0)

      @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                           author: @user)
      @post2 = Post.create(title: 'Second Post', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                           author: @user)
      @post3 = Post.create(title: 'Third Post', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
                           author: @user)

      @comment1 = Comment.create(text: 'Well done!', author: User.first,
                                 post: Post.first)
      @comment2 = Comment.create(text: 'Great Job!', author: User.first, post: Post.first)
      @comment3 = Comment.create(text: 'Congrats!', author: User.first, post: Post.first)
      visit user_post_path(@user, @post1)
    end

    it 'shows posts title' do
      expect(page).to have_content('First Post')
    end

    it 'shows the person who wrote the post' do
      expect(page).to have_content('isaie')
    end

    it 'shows number of comments' do
      post = Post.first
      expect(post.comments_counter).to eql(3)
    end

    it 'shows number of likes' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it 'can see the post\'s body.' do
      expect(page).to have_content('This is my first post')
    end

    it 'can see the username of each commentor.' do
      expect(page).to have_content('isaie')
    end

    it 'can see the comments of each commentor.' do
      expect(@comment1.text).to eql('Well done!')
      expect(@comment2.text).to eql('Great Job!')
      expect(@comment3.text).to eql('Congrats!')
    end
  end
end