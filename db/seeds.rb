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

Category.create(category: "英語")
Category.create(category: "数学")
Category.create(category: "社会")
Category.create(category: "理科")
Category.create(category: "国語")


User.all.each do |user|
  if !user.admin
    v = user.videos.create(title: "my movie" , description: "description", url: "https://www.youtube.com/watch?v=qV5lzRHrGeg")
    v.video_category_relationships.create(category_id: 1)
    v.video_category_relationships.create(category_id: 2)
    v.video_category_relationships.create(category_id: 3)
    v.video_category_relationships.create(category_id: 4)
    
  end
end
