class VideosController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  
  #自分の動画の表示(他人にも見える)
  def show
    @user = User.find_by(id: params[:id])
    #ビデオが1個以上あればすべて取り出す。
    if @user.videos.count > 0
      @videos = Video.where("user_id = #{params[:id].to_s}")
    end
  end
  
  
  #投稿画面の表示
  def new
    @video = Video.new
    set_categories(@video)
  end
  
  #投稿
  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      #投稿成功時
      flash[:success] = "投稿に成功しました！"
      redirect_to video_path(current_user)
    else
      #投稿失敗時
      set_categories(@video)
      render "new"
    end
  end
  
  
  #動画編集画面
  def edit
    @video = Video.find_by(id: params[:id])
    set_categories(@video)
  end
  
  #動画編集
  def update
    @video = Video.find_by(id: params[:id])
    if @video.update_attributes(video_params)
      #編集に成功
      flash[:success] = "編集しました"
      redirect_to video_path @video.user_id
    else
      #編集に失敗
      set_categories(@video)
      render "edit"
    end  
  end
  
  
  #投稿の削除
  def destroy
    
    video =Video.find(params[:id])
    video.destroy
    flash[:success] = "動画は削除されました"
    redirect_to video_path video.user_id
  end
  
  def category
    @parent_category = Category.find(params[:category_id])
  end
  
  
  private
  
    def video_params
      params.require(:video).permit(:title, :description , :url, category_ids: [])
    end
    
    #カテゴリ情報をDBからとりだす
    def set_categories(video)
    @parent_categories = Category.where(parent_id: nil)
    @parent_category = Category.find_by(id: video.category_ids[0]) 
    @parent_category_id = @parent_category ? @parent_category.id : nil
    @child_category = Category.find_by(id: video.category_ids[1])
    end 
end
