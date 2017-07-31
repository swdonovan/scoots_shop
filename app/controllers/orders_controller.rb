class OrdersController < ApplicationController
  before_action :set_cart
  def index
    if @user = current_user
      @orders = @user.orders
    else
      flash[:message] = "You must login to see your orders"
      redirect_to login_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.create(user_id: current_user.id, order_items_attributes: @cart.order_items_attributes)

    @cart.contents.clear
    session[:cart].clear

    redirect_to orders_path
  end
end
