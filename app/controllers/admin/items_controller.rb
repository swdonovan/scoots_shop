class Admin::ItemsController < Admin::AdminController

  def new
    @item = Item.new
  end
end
