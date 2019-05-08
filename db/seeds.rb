users=[]
10.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@test.com"
  password = "aaaaaa"
  user = User.new(name: name,
                  email: email,
                  password:              password,
                  password_confirmation: password)
  user.skip_confirmation!
  users << user
end

User.import users


questions=[]
10.times do |n|
  questions << User.all.sample.questions.new(
                             title: "質問#{n}",
                             content: "テスト"
  )
end

Question.import questions
