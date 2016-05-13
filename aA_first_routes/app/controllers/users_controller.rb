class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    # user = User.find(:id)
    begin
      user = User.find(params[:id])
      render json: user
    rescue ActiveRecord::RecordNotFound => e
      render text: "#{e.message}", status: 404
    end

  end

  def update
    user = User.find(params[:id])
    begin
      user.update(user_params)
      render json: user
    rescue ActionController::ParameterMissing => e
      render text: "#{e.message}", status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end
