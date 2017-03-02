# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin" , email: "test@test.com" , password: "1234567a" , password_confirmation: "1234567a", admin: true )

5.times do |t| 
  User.create(name: "i am #{t+2}",email: "#{t+2}@test.com" , password: "1234567a", password_confirmation: "1234567a")
end

root1 = Category.create(category: "英語")
root1.children.create(category: "TOEICの点数を最短で100点UPさせる方法")
root1.children.create(category: "TOEFL対策")
root1.children.create(category: "英検に受かる")
root1.children.create(category: "IELTS")
root1.children.create(category: "ENGLISH AS SECOND LANUAGE")

root2 = Category.create(category: "数学")
root2.children.create(category: "数学検定")
root2.children.create(category: "数学の点数を上げる")
root2.children.create(category: "統計学を学ぶ")
root2.children.create(category: "微分積分")
root2.children.create(category: "場合の数完全習得")
root2.children.create(category: "いやでもわかる線形代数")

root3 = Category.create(category: "社会")
root3.children.create(category: "世界史入門")
root3.children.create(category: "詳説日本史")
root3.children.create(category: "だれでもわかるローマの歴史")
root3.children.create(category: "スパルタ軍の影")
root3.children.create(category: "メソポタミア文明の繁栄")

root4 = Category.create(category: "理科")
root4.children.create(category: "科学")
root4.children.create(category: "化学入門")
root4.children.create(category: "物理入門")
root4.children.create(category: "光")
root4.children.create(category: "電子")

root5 = Category.create(category: "国語")
root5.children.create(category: "現代文")
root5.children.create(category: "古典入門")
root5.children.create(category: "漢字検")
root5.children.create(category: "国語検定")





User.all.each do |user|
  if !user.admin
    v = user.videos.create(title: "my movie" , description: "description", url: "https://www.youtube.com/watch?v=qV5lzRHrGeg")
 
    v.video_category_relationships.create(category_id: root1.id)
    v.video_category_relationships.create(category_id: root1.children.first.id)
    
  end
end
