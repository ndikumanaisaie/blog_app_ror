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
  end
end
