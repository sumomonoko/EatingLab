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

Genre.find_or_create_by!(name: '朝食')

Genre.find_or_create_by!(name: '昼食')

Genre.find_or_create_by!(name: '夕食')

Genre.find_or_create_by!(name: '間食')

Genre.find_or_create_by!(name: 'お弁当')

Genre.find_or_create_by!(name: 'ダイエット食')

Genre.find_or_create_by!(name: '節約食')

Genre.find_or_create_by!(name: 'デザート')

Genre.find_or_create_by!(name: 'おやつ')


User.find_or_create_by!(email: 'hinako@gmail') do |user|
   user.name = "Hinako";
   user.password = "123456";
   user.introduction = "主婦です。和食メインであげています！";
   user.is_active = true
end

User.find_or_create_by!(email: 'omohi@gmail') do |user|
   user.name = "おもち";
   user.password = "234567";
   user.introduction = "お弁当の投稿が多いです！";
   user.is_active = true
end

User.find_or_create_by!(email: 'tarou@gmail') do |user|
   user.name = "太郎";
   user.password = "345678";
   user.introduction = "和食,洋食,中華などいろいろあげます！";
   user.is_active = true
end

User.find_or_create_by!(email: 'kashi@gmail') do |user|
   user.name = "kashi";
   user.password = "456789";
   user.introduction = "お菓子系専門";
   user.is_active = true
end

User.find_or_create_by!(email: 'momo@gmail') do |user|
   user.name = "momo";
   user.password = "123221";
   user.introduction = "健康を意識した食生活を目指しています。";
   user.is_active = true
end

User.find_or_create_by!(email: 'sumiko@gmail') do |user|
   user.name = "澄子";
   user.password = "654321";
   user.introduction = "楽しく食事ができるように！！";
   user.is_active = true
end

User.find_or_create_by!(email: 'taka@gmail') do |user|
   user.name = "Taka";
   user.password = "321654";
   user.introduction = "ダイエットしてます。アドバイスください。";
   user.is_active = true
end

User.find_or_create_by!(email: 'mami@gmail') do |user|
   user.name = "真美子";
   user.password = "432765";
   user.introduction = "食友探してます！気軽に話してください！";
   user.is_active = true
end

User.find_or_create_by!(email: 'yamato@gmail') do |user|
   user.name = "yamato";
   user.password = "133124";
   user.introduction = "よろしくです。";
   user.is_active = true
end

User.find_or_create_by!(email: 'sara@gmail') do |user|
   user.name = "沙羅";
   user.password = "768543";
   user.introduction = "韓国料理が好きです。よろしくお願いします！";
   user.is_active = true
end

Food.find_or_create_by!(title: "和食") do |food|
   food.genre_id = 3;
   food.menu = "とんかつメイン！サラダ、麦ご飯、味噌汁、漬物。";
   food.point = "麦ご飯にしてアレンジ！！";
   food.user_id = 1;
   food.created_at = DateTime.parse("2024年04月24日")
end