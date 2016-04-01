class AlbumsController < ApplicationController

  before_action :require_login

  def new
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_i, :recording_venue)
  end
end
