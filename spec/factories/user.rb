FactoryBot.define do
  factory :user do
    password ||= 'password'
    email { Faker::Internet.unique.email }
    password { password }
    password_confirmation { password }
    phone_number { Faker::PhoneNumber.phone_number_with_country_code }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    factory :member do
      role { 'member' }
    end
    factory :admin do
      role { 'admin' }
    end
  end
end
