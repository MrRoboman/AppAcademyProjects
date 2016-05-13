class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(cat_params)
    redirect_to cat_url(@cat)
  end

  def destroy
    @cat = Cat.find(params[:id]).destroy
    redirect_to cats_url
  end

  private
  def cat_params
    params.require(:cat).
    permit(:name, :color, :sex, :birth_date, :image_url, :description)
  end
end
