class VideosController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  
  #投稿画面の表示
  def new
    @video = Video.new
  end
  
  #投稿
  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      #投稿成功時
      flash[:success] = "投稿に成功しました！"
      redirect_to user_path(current_user)
    else
      #投稿失敗時
      render "new"
    end
  end
  
  #投稿の削除
  def destroy
  
  end
  
  private
  
    #
    def video_params
      params.require(:video).permit(:title, :description , :url)
    end
end
