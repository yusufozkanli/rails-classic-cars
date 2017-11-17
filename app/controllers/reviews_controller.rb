class ReviewsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @rental = Rental.new
    @review = Review.new(review_params)
    @review.car = @car
    if @review.save
      redirect_to car_path(@car)
    else
      redirect_to car_path(@car)
      # render 'cars/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
