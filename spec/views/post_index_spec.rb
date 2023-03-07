require 'rails_helper'

RSpec.describe 'Render post index page', type: :system do
  before do
    @user = User.create(id: 6, name: 'Isaie', photo: 'https://randomuser.me/api/portraits/men/23.jpg', bio: 'Web developer.', post_counter: 0)
    @first_post = Post.create(author: @user, title: 'post1', text: 'first post', likes_counter: 0, comments_counter: 0)
    @second_post = Post.create(author: @user, title: 'Hello', text: 'first post', likes_counter: 0, comments_counter: 0)
    Comment.create(text: 'No comments yet.', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'Comments', author_id: @user.id, post_id: @first_post.id)
  end

  describe 'index post page' do
    it 'displays post text' do
      visit('/users/1/posts/')
      expect(page).to have_content('first post')
    end

    it 'display the post title' do
      visit('/users/1/posts/')
      expect(page).to have_content(@first_post.title)
    end

    it 'display the post body' do
      visit('/users/1/posts/')
      expect(page).to have_content(@first_post.text)
    end

    it 'display the first comment on a post' do
      visit('/users/1/posts/')
      expect(page).to have_content('Comments')
    end

    it 'display the how many comments' do
      visit('/users/1/posts/')
      expect(page).to have_content('Comments')
    end

    it 'display the how many Likes' do
      visit('/users/1/posts/')
      expect(page).to have_content('Likes: 0')
    end
  end
end
