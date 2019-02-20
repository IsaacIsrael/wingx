class OrdersController < ApplicationController
  before_action :set_flight, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:new]

  def

  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.flight = @flight
    authorize @order
    if @order.save
      redirect_to root_path
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
