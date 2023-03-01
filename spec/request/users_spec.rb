require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'should succeed' do
      get('/')
      expect(response).to have_http_status(:ok)
    end
    it 'should render template index' do
      get('/')
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:id' do
    before do
      @user = User.create(name: 'Isaie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Web developer.')
      @post = Post.create(author: @user, title: 'first post', text: 'Show a user and his posts')
    end
    it 'should succeed' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
    end
    it 'should render template ' do
      get "/users/#{@user.id}"
      expect(response).to render_template('show')
    end
    it 'should render render user profile' do
      get "/users/#{@user.id}"
      expect(response.body).to include(@post.text)
    end
  end
end
