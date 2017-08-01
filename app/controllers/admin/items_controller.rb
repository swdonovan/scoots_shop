class Admin::ItemsController < Admin::AdminController

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_attributes)
  end

  private

  def item_attributes
    params.require(:item).permit(:title, :description, :price, :category_ids, :image)
  end
end
