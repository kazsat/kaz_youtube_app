module UsersHelper
  
  #http://youtube.com/watch?v=〇〇〇〇 この〇〇〇〇の部分を取り出す
  def create_video_id(url)
    url.gsub(/https:\/\/www.youtube.com\/watch\?v=(\w+)/){"#{$1}"} 
  end
end
