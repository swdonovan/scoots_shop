class ChargesController < ApplicationController
  before_action :set_cart

  def new
  end

  def create
    # Amount in cents
    @amount = (@cart.total_price * 100).to_i

    customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      order = Order.create(user_id: current_user.id, order_items_attributes: @cart.order_items_attributes)

      flash[:success] = 'Order was successfully placed'

      flash[:success] = "Thanks, you paid #{@cart.total_price}! Have a great day"

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    @cart.contents.clear
    session[:cart].clear if session[:cart]
    redirect_to orders_path

  rescue Stripe::CardError => e
    flash[:error] = e.message

    redirect_to new_charge_path
  end
end
