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

User.all.each do |user|
  if !user.admin
    user.videos.create(title: "my movie" , description: "description", url: "https://www.youtube.com/watch?v=qV5lzRHrGeg")
  end
end

User.second.videos.create(title: "mine" , description: "description", url: "https://www.youtube.com/watch?v=fWNaR-rxAic")
User.second.videos.create(title: "von jour" , description: "description", url: "https://www.youtube.com/watch?v=AJtDXIazrMo")
User.third.videos.create(title: "tecj" , description: "description", url: "https://www.youtube.com/watch?v=lWA2pjMjpBs")
User.third.videos.create(title: "lie to me " , description: "i dare you", url: "https://www.youtube.com/watch?v=JF8BRvqGCNs")