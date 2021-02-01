require 'rails_helper'

RSpec.describe Article, type: :model do
  describe ' #validations' do
    it 'should text that a factory is valid' do
      expect(build(:article)).to be_valid
    end

    it 'should validate the presence of the title' do
      article = build(:article, title: '')
      expect(article).not_to be_valid
      expect(article.errors.messages[:title]).to include("can't be blank")
    end

    it 'should validate the presence of the content' do
      article = build(:article, content: '')
      expect(article).not_to be_valid
      expect(article.errors.details[:content]).to include(error: :blank)
    end
  end
end
