FactoryBot.define do
  factory :user do
    name { 'user' }
    sequence(:email) { |n| "user#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now - 100 }
  end

  factory :ueki do
    name { 'Ueki' }
  end
end
