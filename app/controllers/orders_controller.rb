class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create]
  before_action :checkout_params, only: :create

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

  def new
  end

  def create
    user = User.find_by(email: checkout_params[:email])
    @order = user.orders.create(submitted_at: Time.now)
    @cart.cart_items.each {|item| @order.items << item }
    flash[:success] = "Thanks, you paid #{@cart.total_price}! Have a great day"
    session[:cart].clear
    redirect_to order_path(@order)
  end

  private

  def checkout_params
    params.require(checkout_path).permit(:email, :credit_card, :name)
  end
end
