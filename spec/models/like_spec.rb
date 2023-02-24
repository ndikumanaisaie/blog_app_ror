require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations for the Like model' do
    before(:each) do
      @like = Like.new(author_id: 4, post_id: 5)
    end

    before { @like.save }

    it 'if author_id is present' do
      @like.author_id = 'a'
      expect(@like).to_not be_valid
    end

    it 'if post_id is present' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    describe 'Should test update_likes_counter method in like model' do
      it 'Should be true' do
        expect(@like.update_likes_counter).to eq true
      end
    end
  end
end
