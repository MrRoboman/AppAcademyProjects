class SessionsController < ApplicationController

  before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    login_user!
  end

  def destroy
    logout_user!
  end

  private

  def require_login
    redirect_to cats_url if logged_in?
  end
end
