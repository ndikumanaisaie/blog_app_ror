require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations for the comment model' do
    before(:each) do
      @comment = Comment.new(text: 'First comment', author_id: 2, post_id: 1)
    end

    before { @comment.save }

    it 'if author_id is present' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'if author_id is present' do
      @comment.author_id = 'a'
      expect(@comment).to_not be_valid
    end
    
    it 'if post_id is present' do
      @comment.post_id = nil
      expect(@comment).to_not be_valid
    end

  end
end