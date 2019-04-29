FactoryBot.define do
  factory :user do
    name 'Tester'
    sequence(:email) {|n| "user#{n}@test.com"}
    password "userpassword"
    password_confirmation "userpassword"
  end

  factory :ueki do
    name 'Ueki'
  end
end
