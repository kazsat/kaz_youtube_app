module SessionsHelper
   # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
   # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
   # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  #ユーザーが管理者ならtrue
  def admin_user?(user = current_user)
    user.admin
  end
  
  #ログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # 正しいユーザーかどうか確認
  def correct_user
      @user = User.find(params[:id])
    if !current_user.admin
      redirect_to(root_url) unless @user == current_user
    end
  end
  
  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
