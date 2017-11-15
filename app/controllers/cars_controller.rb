class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cars = Car.where("brand ILIKE ?", "%#{params[:query]}%")
    if @cars.empty?
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
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

  def map
    @cars = Car.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@cars) do |car, marker|
      marker.lat car.latitude
      marker.lng car.longitude
    end
  end

  private

  def car_params
  params.require(:car).permit(:brand, :model, :year, :color, :price, :description, :address, :photo, :photo_cache)
  end


end
