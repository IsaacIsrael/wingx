class FlightsController < ApplicationController
  before_action :find_flight, only: [:show, :edit, :update, :destroy]
  def index
    @flights = Flight.all
  end

  def show; end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to @flight
    else
      render :new
    end
  end

  def edit; end

  def update
    @flight.update(flight_params)
    redirect_to @flight
  end

  def destroy
    @flight.destroy
    redirect_to @flights
  end

  private

  def find_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:origin, :destiny, :date, :capacity, :price, :description)
  end
end
