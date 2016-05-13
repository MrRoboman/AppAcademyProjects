class BandsController < ApplicationController

  before_action :require_login
  
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end
end
