FactoryBot.define do
  factory :article do
    title { 'Article title' }
    content { 'Action text: content' }
    trait :with_cover_image do
      cover_image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'images', 'test_image(50kb).jpg'), 'image/jpg') }
    end
  end
end
