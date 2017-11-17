class ReviewsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @rental = Rental.new
    @review = Review.new(review_params)
    @review.car = @car
    if @review.save
      respond_to do |format|
        format.html { redirect_to car_path(@car) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'cars/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
