# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = [
  {
    username: 'jeek', email: 'jeek@mail.com', password: '123456', role: 'admin'
  },
  {
    username: 'Andrew', email: 'dron@mail.ru', password: '123456', role: 'admin'
  },
  {
    username: 'artem', email: 'tema@mail.ru', password: '123456', role: 'user'
  }
]

advertisings_type = [
  {
    name: 'car'
  },
  {
    name: 'house'
  }
]

User.create(user)
AdvertisingsType.create(advertisings_type)


50.times do
  Advertising.create(
    advertisings_type: "house",
    user_id: 1,
    title: Faker::Hipster.sentence,
    status: "published",
    text: Faker::Hipster.paragraphs(6)
  )
end

20.times do
  Advertising.create(
    advertisings_type: "car",
    user_id: 2,
    title: Faker::Hipster.sentence,
    text: Faker::Hipster.paragraphs(6),
    status: "draft"
  )
end
