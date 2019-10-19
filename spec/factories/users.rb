FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now - 100 }
  end

  factory :user_ueki, class: User do
    name { 'ueki' }
    email { "ueki@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now - 100 }
  end
end
