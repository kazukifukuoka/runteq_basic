# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'zzzzzz',
      password_confirmation: 'zzzzzz'
  )
end

100.times do |index|
  Board.create(
      user: User.offset(rand(User.count)).first,
      title: "タイトル#{index + 1}",
      body: "本文#{index + 1}"
  )
end

puts '成功'