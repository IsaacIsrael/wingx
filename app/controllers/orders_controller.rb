class OrdersController < ApplicationController
  before_action :set_flight, only: %i[new create]
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @order = Order.new
    @order.flight = @flight
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.flight = @flight
    authorize @order

    if @order.save
      redirect_to flight_path(@flight)
    else
      render :new
    end
  end

  private

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end

  def order_params
    params.require(:order).permit(:passenger_number, :flight_id, :user_id)
  end
end
