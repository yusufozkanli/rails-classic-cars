class RentalsController < ApplicationController
  before_action :set_car

  def create
    @rental = Rental.new(rental_params)
    @rental.user_id = current_user.id
    @rental.car = @car
    if @rental.save
      redirect_to car_path(@car)
      flash[:notice] = "Successfully booked between #{@rental.end_date} and #{@rental.date}"
    else
      render 'cars/show'
    end
  end

  # def confirmation
  #   @rental = @car.rentals.last
  #   if (@rental.end_date - @rental.date) == 0
  #     @price = @car.price
  #   else
  #     @price = @car.price * (@rental.end_date - @rental.date)
  #   end
  # end

  private

  def rental_params
  params.require(:rental).permit(:date, :end_date)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

end
