class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!
    return if current_user.nil?
    current_user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["You must log in"]
      redirect_to new_session_url
    end
  end
end
