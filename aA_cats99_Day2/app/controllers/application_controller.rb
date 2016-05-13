class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to cats_url
    else
      flash.now[:user_name] = params[:user][:user_name]
      flash.now[:errors] = "BAD CREDENTIALS. NO CATS FOR YOU."
      render :new
    end
  end

  def logged_in?
    return true if session[:session_token]
    false
  end

  def logout_user!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
    render :new
  end
end
