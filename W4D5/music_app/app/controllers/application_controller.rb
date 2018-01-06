class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    session_cookie = session[:session_token]
    return nil if session_cookie.nil?
    @current_user ||= User.find_by_credentials(params[:email], params[:password])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    return false if @current_user
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
end
