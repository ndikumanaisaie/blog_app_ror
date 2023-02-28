require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before do
      @user = User.create(name: 'Isaie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Web developer.')
      @post = Post.create(author: @user, title: 'first post', text: 'List of all posts')
    end
    it 'should succeed' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(:ok)
    end
    it 'should render index' do
      get "/users/#{@user.id}/posts"
      expect(response).to render_template('index')
    end
    it 'should render posts' do
      get "/users/#{@user.id}/posts"
      expect(response.body).to include(@post.text)
    end

    it 'should succeed' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to have_http_status(:success)
    end
    it 'should render template show' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to render_template('show')
    end
    it 'should render a user specific post' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response.body).to include(@post.title)
    end
  end
end
