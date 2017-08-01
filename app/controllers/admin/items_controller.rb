class Admin::ItemsController < Admin::AdminController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_attributes)
    if @item.save!
      redirect_to item_path(@item)
    else
      render file: '/public/404'
    end
  end

  private

  def item_attributes
    params.require(:item).permit(:title, :description, :price, :image, category_ids: [])
  end
end
