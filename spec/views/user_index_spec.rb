require 'rails_helper'

RSpec.describe 'visit the user home page', type: :system do
  before do
    @user1 = User.create(id: 1, name: 'Isaie', photo: 'https://randomuser.me/api/portraits/men/13.jpg', bio: 'Web developer', post_counter: 0)
    @user2 = User.create(id: 2, name: 'Eliane', photo: 'https://randomuser.me/api/portraits/women/21.jpg', bio: 'Telecom Engineer', post_counter: 0)
    @post1 = Post.create(author: @user1, title: 'My first post.', text: 'post description 1', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author: @user2, title: 'My second post.', text: 'post description 2', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user1, title: 'My third post.', text: 'post description 3', comments_counter: 0, likes_counter: 0)
    Comment.create(post: @post1, author: @user2, text: 'hallo there')
    Comment.create(post: @post2, author: @user1, text: 'You look stunning')
  end

  describe 'index page' do
    it 'should show the username of all other users' do
      visit '/'
      expect(page).to have_content(@user1.name)
    end

    it 'should show the profile picture for each user' do
      visit '/'
      expect(page).to have_selector("img[src*='#{@user1.photo}']")
    end

    it 'should shows number of posts each user has written' do
      visit '/'
      expect(page).to have_content("Number of posts: #{@user1.post_counter}")
    end

    it 'should direct to the users profile page' do
      visit '/'
      click_on @user2.name
      expect(page).to have_current_path("/users/#{@user2.id}/")
    end
  end
end
require 'rails_helper'
RSpec.describe 'visit the user home page', type: :system do
  before do
    @user1 = User.create(id: 1, name: 'Isaie', photo: 'https://randomuser.me/api/portraits/men/13.jpg', bio: 'Web developer', post_counter: 0)
    @user2 = User.create(id: 2, name: 'Eliane', photo: 'https://randomuser.me/api/portraits/women/21.jpg', bio: 'Telecom Engineer', post_counter: 0)
    @post1 = Post.create(author: @user1, title: 'My first post.', text: 'post description 1', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author: @user2, title: 'My second post.', text: 'post description 2', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author: @user1, title: 'My third post.', text: 'post description 3', comments_counter: 0, likes_counter: 0)
    Comment.create(post: @post1, author: @user2, text: 'hallo there')
    Comment.create(post: @post2, author: @user1, text: 'You look stunning')
  end
  describe 'index page' do
    it 'should show the username of all other users' do
      visit '/'
      expect(page).to have_content(@user1.name)
    end
    it 'should show the profile picture for each user' do
      visit '/'
      expect(page).to have_selector("img[src*='#{@user1.photo}']")
    end
    it 'should shows number of posts each user has written' do
      visit '/'
      expect(page).to have_content("Number of posts: #{@user1.post_counter}")
    end
    it 'should direct to the users profile page' do
      visit '/'
      click_on @user2.name
      expect(page).to have_current_path("/users/#{@user2.id}/")
    end
  end
end