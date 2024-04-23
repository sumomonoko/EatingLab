# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: 'foodlab@gmail') do |admin|
  admin.name = "aaaaa",
  admin.password = "foodlab1321"
end

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
Genre.find_or_create_by!(genres)

User.find_or_create_by!(email: 'hinako@gmail') do |user|
   user.name = "Hinako",
   user.password = "123456",
   user.introduction = "主婦です。和食メインであげています！",
   user.active = true
end

User.find_or_create_by!(email: 'omohi@gmail') do |user|
   user.name = "おもち",
   user.password = "234567",
   user.introduction = "お弁当の投稿が多いです！",
   user.active = true
end

User.find_or_create_by!(email: 'tarou@gmail') do |user|
   user.name = "太郎",
   user.password = "345678",
   user.introduction = "和食,洋食,中華などいろいろあげます！",
   user.active = true
end

User.find_or_create_by!(email: 'kashi@gmail') do |user|
   user.name = "kashi",
   user.password = "456789",
   user.introduction = "お菓子系専門",
   user.active = true
end

User.find_or_create_by!(email: 'momo@gmail') do |user|
   user.name = "momo",
   user.password = "123221",
   user.introduction = "健康を意識した食生活をしています。",
   user.active = true
end

User.find_or_create_by!(email: 'sumiko@gmail') do |user|
   user.name = "澄子",
   user.password = "654321",
   user.introduction = "楽しく食事ができるように！！",
   user.active = true
end

User.find_or_create_by!(email: 'taka@gmail') do |user|
   user.name = "Taka",
   user.password = "321654",
   user.introduction = "ダイエットしてます。アドバイスください。",
   user.active = true
end

User.find_or_create_by!(email: 'mami@gmail') do |user|
   user.name = "真美子",
   user.password = "432765",
   user.introduction = "食友探してます！気軽に話してください！",
   user.active = true
end