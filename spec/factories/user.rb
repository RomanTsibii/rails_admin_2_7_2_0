FactoryBot.define do
  factory :user do
    password ||= 'password'
    email { 'roman.ts@coaxsoft.com' }
    password { password }
    factory :member do
      role { 'member' }
    end
    factory :admin do
      role { 'admin' }
    end
  end
end
