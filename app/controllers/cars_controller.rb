class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cars = Car.last(6)
  end

  def show
    @car = Car.find(params[:id])
    # @cars = Car.where.not(latitude: nil, longitude: nil)
    @rental = Rental.new
    @hash = Gmaps4rails.build_markers(@car) do |car, marker|
        marker.lat car.latitude
        marker.lng car.longitude
    end
    @review = Review.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    if @car.save
      redirect_to car_path(@car)
    else
      render 'new'
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  def search
    if params[:query].blank?
      redirect_to root_path
    else
      # @cars = Car.where("brand ILIKE ?", "%#{params[:query]}%")
      @cars = Car.search(params[:query])
    end
  end

  def map
    @cars = Car.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@cars) do |car, marker|
      marker.lat car.latitude
      marker.lng car.longitude
      # marker.infowindow "<h1>hello</h1>"
      marker.infowindow render_to_string(partial: "/cars/infobox", locals: { car: car })
    end
  end

  private

  def car_params
  params.require(:car).permit(:brand, :model, :year, :color, :price, :description, :address, :photo, :photo_cache)
  end

end
