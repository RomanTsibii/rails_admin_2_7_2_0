require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validation' do
    it 'should be valid factories' do
      user = build :user
      expect(user).to be_valid
    end
  end
end
