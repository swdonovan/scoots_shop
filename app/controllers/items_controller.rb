class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    if current_admin
      item = Item.create()
    end
  end
end
