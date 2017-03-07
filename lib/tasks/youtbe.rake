namespace :youtube do
  desc "youtube"    
  
  task score: :environment do 
    videos = Video.all
    videos.each do |video|
      begin
        video.score = view_count(video.url) if video.url?
        p "#{video.title} : #{video.score}"
        video.save
      rescue
        puts "何か問題が発生しました。"
      end
    end
  end
  
  def view_count(url)
    video = Yt::Video.new(id: ApplicationController.helpers.create_video_id(url))
    view_count = video.view_count
    view_count
  end
end