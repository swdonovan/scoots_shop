class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :index, :destroy, :update]

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    if params[:to_cart]
      redirect_to cart_path
    else
      redirect_to root_path
    end
  end

  def index
    @items = Item.find(@cart.contents.keys)
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)

    flash[:success] = "Successfully removed #{view_context.link_to(item.title, carts_path(item_id: item.id, to_cart: true), method: :post)} from your cart."
    redirect_to '/cart'
  end

  def update
    if params[:item_to_increase]
      @cart.increase_item(params[:item_to_increase])
    elsif params[:item_to_decrease]
      @cart.decrease_item(params[:item_to_decrease])
    end
    redirect_to cart_path
  end
end
