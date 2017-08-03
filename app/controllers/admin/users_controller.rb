class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show]
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

  def update
    @user =  User.find(session[:user_id])

    @user.update(user_attributes)
    if @user.save
      redirect_to admin_dashboard_path(@user)
    else
      render '/admin/user/show'
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_attributes
    params.require(:user).permit(:username, :password, :address, :email)
  end
end
