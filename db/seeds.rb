[1..100].each do |n|
  name  = Faker::Name.name
  email = "user#{n}@test.com"
  password = "aaaaaa"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
