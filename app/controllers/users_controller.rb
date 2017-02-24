class UsersController < ApplicationController
  #before_action :logged_in_user, only: :show
  #ユーザー登録フォームの表示
  def new
    @user = User.new
  end
  
  #ユーザー登録
  def create
    @user = User.new(user_params)
    if @user.save
      #成功時
      log_in @user
      flash[:success] = "登録が完了しました！"
      redirect_to @user
    else
      #失敗時
      render "new"
    end
  end
  
  #ユーザー画面
  def show
    @user = User.find(params[:id])
    if User.find(params[:id]).videos.count > 0
      @video_info = Video.where("user_id = #{params[:id].to_s}")
    end
  end
  
  #ユーザー情報編集画面の表示
  def edit
    @user = User.new(user_params)
  end
  
  #ユーザー情報編集
  def update
  end
  
  #ストロングパラメータ
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
end
