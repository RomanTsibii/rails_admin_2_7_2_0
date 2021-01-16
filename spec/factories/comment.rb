FactoryBot.define do
  factory :comment do
    content { 'comment content' }
    article { create(:article) }
    commentable { create(:user) }
  end
end
