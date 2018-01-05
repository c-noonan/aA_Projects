class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_owner?

  def current_user
    session_cookie = session[:session_token]
    return nil if session_cookie.nil?
    @current_user ||= User.find_by(session_token: session_cookie)
  end

  def logged_in?
    !!current_user
  end

  def is_owner?
    return false unless logged_in?
    cat_id = params[:id]
    current_user.cats.each do |catt|
      return true if catt.id = cat_id
    end
    false
  end


  def login!(user)
    p "Trying to log in"
    return false if current_user
    user.reset_session_token
    session[:session_token] = user.session_token
  end

  def logout!
    session[:session_token] = nil
    current_user.reset_session_token if @current_user
  end

end
