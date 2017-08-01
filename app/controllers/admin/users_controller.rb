class Admin::UsersController < Admin::AdminController

  def show

  end

  def dashboard
    if params[:sort_by]
      @orders = Order.sorted_orders(params[:sort_by])
      @sort = params[:sort_by]
    else
      @orders = Order.all
    end

    @status_count = Order.count_by_status
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
