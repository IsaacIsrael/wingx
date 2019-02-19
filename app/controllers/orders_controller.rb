class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @user = User.find(params[:user_id])
    @order = Order.new(order_params)
    @order.user = @user
    @order.flight = @flight
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:passenger_number, :flight_id, :user_id)
  end
end
