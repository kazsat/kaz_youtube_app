class SessionsController < ApplicationController
  #ログインページの表示
  def new
  end
  
  #ログイン
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ログイン成功時
      log_in(user)
      #チックボックスがチェックされていたらcookieに永続セッション情報を記憶する
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_url
    else
      #ログイン失敗時
      flash.now[:danger] = "ログイン情報が正しくありません"
      render "new"
    end
  end
  
  #ログアウト
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
