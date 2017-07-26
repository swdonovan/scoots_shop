class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :index]

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
end
