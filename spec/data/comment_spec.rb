require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#validate' do
    it 'should be valid' do
      comment = build :comment
      expect(comment).to be_valid
    end

    it 'should be invalid' do
      comment = build :comment, content: ''
      expect(comment.content.present?).to be false
    end
  end
end
