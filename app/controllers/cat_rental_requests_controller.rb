class CatRentalRequestsController < ApplicationController
  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def show
    @request = CatRentalRequest.find(params[:id])
    render :show
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(rental_request_params)

    if @request.save
      redirect_to cat_rental_request_url(@request)
    else
      render :new
    end
  end

  def delete
  end

  def update
  end

  def edit
  end

  private
  def rental_request_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :status)
  end
end
