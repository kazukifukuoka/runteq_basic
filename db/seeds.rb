# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: 'seed@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.last_name = 'seed'
  user.first_name = '太郎'
  puts 'ユーザー作成成功'
end


user = User.find_by(email: 'seed@example.com')

10.times do |n|
  Board.create!(
    title: Faker::Dessert.variety,
    body: "本文#{ n + 1}",
    user_id: user.id
  )
end

puts '成功'