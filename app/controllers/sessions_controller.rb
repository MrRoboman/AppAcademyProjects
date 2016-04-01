class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:session][:email],
      params[:session][:password])
    if @user.nil?
      @user = User.new(email: params[:session][:email])
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      login!(@user)
      redirect_to bands_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
