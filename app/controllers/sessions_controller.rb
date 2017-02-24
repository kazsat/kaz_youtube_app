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
      redirect_back_or user
    else
      #ログイン失敗時
      flash.now[:danger] = "ログイン情報が正しくありません"
      render "new"
    end
  end
  
  #ログアウト
  def destroy
    log_out
    redirect_to root_url
  end
end
