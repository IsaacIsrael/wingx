class OrdersController < ApplicationController
  before_action :set_flight, only: %i[create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.flight = @flight
    authorize @order
    if @order.save
      respond_to do |format|
        format.html {  redirect_to users_show_path }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js # <-- idem
      end
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
