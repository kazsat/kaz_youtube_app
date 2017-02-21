class UsersController < ApplicationController
  #ユーザー登録フォームの表示
  def new
    @user = User.new
  end
  
  #ユーザー登録
  def create
    @user = User.new(user_params)
    if @user.save
      #成功時
    else
      #失敗時
      render "new"
    end
  end
  
  
  #ストロングパラメータ
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
end
