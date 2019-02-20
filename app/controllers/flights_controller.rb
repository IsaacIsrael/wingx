class FlightsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_flight, only: %i[show edit update destroy]

  def index
    @flights = policy_scope(Flight)
  end

  def show; end

  def new
    @flight = Flight.new
    authorize @flight
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.company = current_user.company
    authorize @flight

    if @flight.save
      redirect_to root_path
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
    redirect_to company_path(current_user.company)
  end

  private

  def find_flight
    @flight = Flight.find(params[:id])
    authorize @flight
  end

  def flight_params
    params.require(:flight).permit(:origin, :destiny, :date, :capacity, :price, :description)
  end
end
