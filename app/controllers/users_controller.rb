class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  
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
  
  #ユーザー画面(他人は見れない)
  def show
    @user = User.find_by(id: params[:id])
    #管理者なら全員のprofileを見れる
    if logged_in? && admin_user?
      render "show"
    #他人のprofileにアクセスしようとしたらホームへ
    elsif @user != current_user 
      flash[:danger] = "不正なアクセスです" 
      redirect_to root_path
    end
  end
  
  #すべてのユーザー(adminのみが見れる)
  def everybody
    @user = User.all if admin_user?
  end
  
  #ユーザー情報編集画面の表示
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  #ユーザー情報編集
  def update
    @user =User.find_by(id:params[:id])
    if @user.update_attributes(user_params)
      #編集に成功した時
      flash[:success] = "編集しました"
      redirect_to @user
    else
      #編集に失敗した時
      render "edit"
    end
  end
  
  def destroy
  User.find(params[:id]).destroy
    flash[:success] = "ユーザーは削除されました"
    redirect_to root_path
  end
  
  #ストロングパラメータ
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
end
