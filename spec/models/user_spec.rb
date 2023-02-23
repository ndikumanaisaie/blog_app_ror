require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations for User model' do
    before(:each) do
      @user = User.new(name: 'Isaie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'software engineer', post_counter: 2)
    end

    before { @user.save }

    it 'if there is name' do
      @user.name = 'Isaie'
      expect(@user).to be_valid
    end

    it 'PostCounter must be greater than or equal to zero' do
      @user.post_counter = -1
      expect(@user).to_not be_valid
    end
  end

  describe 'Should test recent_post method' do
    before { 4.times { |post_n| Post.create(author_id: post_n, title: "This is post #{post_n}", text: "this is text #{post_n}") } }

    it 'Should show three recent posts' do
      expect(User.new.recent_posts).to eq(Post.last(3))
    end
  end
end
