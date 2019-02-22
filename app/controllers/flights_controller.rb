class FlightsController < ApplicationController
  before_action :find_flight, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @flights = policy_scope(Flight)
  end

  def show
    @order = Order.new
    @order.flight = @flight
  end

  def new
    @flight = Flight.new
    authorize @flight
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.company = current_user.company
    authorize @flight

    if @flight.save
      redirect_to @flight
    else
      render :new
    end
  end

  def edit; end

  def update
    if @flight.update(flight_params)
      redirect_to flight_path(@flight)
    else
      render :edit
    end
  end

  def destroy
    @flight.destroy
    # redirect_to company_path(current_user.company)
  end

  private

  def find_flight
    @flight = Flight.find(params[:id])
    authorize @flight
  end

  def flight_params
    params.require(:flight).permit(:origin, :destiny, :date, :capacity, :price,
                                   :description, :photo)
  end
end
