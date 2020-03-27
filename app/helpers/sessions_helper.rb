module SessionsHelper
  def log_in(user)
    user.remember
    cookies.signed[:user_id] = user.id
    cookies[:remember_token] = user.remember_token
  end

  def current_user
    if (user_id = cookies.signed[:user_id])
      @current_user ||= User.find_by(id: user_id)
      log_in(@current_user) if @current_user
      @current_user
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
