require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations for the Like model' do
    subject do
      user1 = User.new(name: 'Isaie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'a web developer', post_counter: 2)
      post = Post.new(title: 'Titl1', text: 'Text1', comments_counter: 2, likes_counter: 1, author: user1)
      Like.create(author: user1, post:, post_id: post.id)
      Like.create(author: user1, post:, post_id: post.id)
    end
    # before(:each) do
    #   @like = Like.new(author_id: 4, post_id: 5)
    # end

    # before { @like.save }

    # it 'if author_id is present' do
    #   @like.author_id = 'a'
    #   expect(@like).to_not be_valid
    # end

    # it 'if post_id is present' do
    #   @like.post_id = nil
    #   expect(@like).to_not be_valid
    # end

    it 'should update likes counter' do
      expect(subject.update_likes_counter).to eq true
      expect(subject.post.likes_counter).to eq 2
    end
  end
end
