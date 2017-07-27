class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :index, :destroy, :update]

  def create
    item = Item.find(params[:item_id])
    @cart = Cart.new(session[:cart])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to root_path
  end

  def index
    @items = Item.find(@cart.contents.keys)
  end

  def destroy
    @cart.remove_item(params[:item_id])

    redirect_to '/cart'
  end

  def update
    if params[:item_to_increase]
      @cart.increase_item(params[:item_to_increase])
    end
    redirect_to cart_path
  end
end
