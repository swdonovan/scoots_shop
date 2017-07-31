class Admin::ItemsController < Admin::AdminController
  before_action :set_item, only: [:show, :edit]
  def index
      @items = Item.all
  end

  def show
  end

  def edit
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
