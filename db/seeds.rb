# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: 'aaaa',
   email: 'foodlab@gmail',
   password: 'foodlab1321',
   password_confirmation: "foodlab1321"
)

genres = [
  { name: '朝食' },
  { name: '昼食' },
  { name: '夕食' },
  { name: '間食' },
  { name: 'お弁当' },
  { name: 'ダイエット食' },
  { name: '節約食' },
  { name: 'デザート' },
  { name: 'おやつ' }
]

Genre.create!(genres)

users = [
  { name: '', email: '@example.com', password: 'password' },
  { name: 'Jane', email: 'jane@example.com', password: 'secret' }
]

User.create!(users)