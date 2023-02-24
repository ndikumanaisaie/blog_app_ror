require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations for the comment model' do
    subject do
      user1 = User.new(name: 'Isaie', photo: 'https://randomuser.me/api/portraits/men/23.jpg', bio: 'sofware engineer', post_counter: 3)
      post1 = Post.new(title: 'my title', text: 'my Text', comments_counter: 2, likes_counter: 1, author: user1)
      @comment = Comment.new(text: 'First comment', author: @user1, post: post1)
    end

    it 'should update comments counter' do
      expect(subject.post.comments_counter).to eq 2
    end
    # it 'if author_id is present' do
    #   @comment.text = nil
    #   expect(@comment).to_not be_valid
    # end

    # it 'if author_id is present' do
    #   @comment.author_id = 'a'
    #   expect(@comment).to_not be_valid
    # end

    # it 'if post_id is present' do
    #   @comment.post_id = nil
    #   expect(@comment).to_not be_valid
    # end

    describe 'Should test update_comments_counter method in comment model' do
      it 'Should be true' do
        expect(subject.update_comments_counter).to eq true
      end
    end
  end
end
