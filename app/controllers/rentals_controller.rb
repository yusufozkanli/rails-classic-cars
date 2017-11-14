class RentalsController < ApplicationController
  before_action :set_car

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user_id = current_user.id
    @rental.car = @car
    if @rental.save
      redirect_to car_path(@car)
    else
      render 'new'
    end
  end

  private

  def rental_params
  params.require(:rental).permit(:date)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
