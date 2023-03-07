require 'rails_helper'

RSpec.describe 'visit the post show page', type: :system do
  before do
    @user = User.create(id: 1, name: 'Isaie', photo: 'https://randomuser.me/api/portraits/men/23.jpg', Bio: 'Web developer', post_counter: 0)
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post.', likes_counter: 0, comments_counter: 0)
    @second_post = Post.create(author: @user, title: 'Hello', text: 'This is my second post.', likes_counter: 0, comments_counter: 0)
    Comment.create(post: @first_post, author: @user, text: 'hallo there!')
    Comment.create(post: @first_post, author: @user, text: 'hallo there!')
    Comment.create(post: @first_post, author: @user, text: 'hallo there!')
  end

  describe 'show post page' do
    it 'should display the post title' do
      visit '/'
      click_on @user.name
      expect(page).to have_content(@first_post.title)
    end

    it 'should show the person who wrote the post' do
      visit '/'
      click_on @user.name
      expect(page).to have_content('Tom')
    end

    it 'can see the username of each commentor.' do
      visit '/'
      click_on @user.name
      expect(page).to have_content('Isaie')
    end

    it 'displays number of comments' do
      visit('/users/1/posts/')
      expect(page).to have_content('Comments: 3')
    end

    it 'displays number of likes' do
      visit('/users/1/posts/')
      expect(page).to have_content('Likes: 0')
    end

    it 'displays the content of the post' do
      visit '/'
      click_on @user.name
      expect(page).to have_content(@first_post.text)
    end

    it 'displays the comments of each commentor.' do
      visit('/users/1/posts/')
      expect(page).to have_content 'hallo there!'
      expect(page).to have_content 'hallo there!'
      expect(page).to have_content 'hallo there!'
    end
  end
end
