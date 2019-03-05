users=[]
100.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@test.com"
  password = "aaaaaa"
  users << User.new(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

User.import users
