# ユーザー
User.create!(name:  "長江歩夢",
    email: "ayumu100811@rails.com",
    password:              "foobar",
    password_confirmation: "foobar",
    admin:     true,
    activated: true,
    activated_at: Time.zone.now)

99.times do |n|
  gimei = Gimei.new

  name  = gimei.name.hiragana
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
        email: email,
        password:              password,
        password_confirmation: password,
        activated: true,
        activated_at: Time.zone.now)
end


User.create!(name:  "ゲストユーザー",
  email: "guest-user@example.com",
  password:              "foobar",
  password_confirmation: "foobar",
  activated: true,
  activated_at: Time.zone.now)

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  title = Faker::Lorem.sentence(word_count: 5)
  game_category = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content, title: title, game_category: game_category) }
end



# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }