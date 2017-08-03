class OrdersController < ApplicationController
  before_action :set_cart
  def index
    if current_user
      @orders = current_user.orders
    else
      flash[:danger] = "You must login to see your orders"
      redirect_to login_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.create(user_id: current_user.id, order_items_attributes: @cart.order_items_attributes)

    flash[:success] = 'Order was successfully placed'
    @cart.contents.clear
    session[:cart].clear if session[:cart]

    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])

    order.update(status: params[:status])

    redirect_to request.referrer
  end
end
