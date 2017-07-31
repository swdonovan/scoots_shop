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

    user = User.find_by(email: params[:stripeEmail])
    @order = user.orders.create(submitted_at: Time.now)
    @cart.cart_items.each {|item| @order.items << item }

    flash[:success] = "Thanks, you paid #{@cart.total_price}! Have a great day"
    
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    session[:cart].clear

  rescue Stripe::CardError => e
    flash[:error] = e.message

    redirect_to new_charge_path
  end
end
