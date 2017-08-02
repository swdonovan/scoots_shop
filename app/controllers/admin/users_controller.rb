class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: :show

  def show
    if session_check?(@user)
      render 'admin/users/show'
    else
      session[:user_id] = nil
      flash[:danger] = "GET OUT"
      redirect_to login_path
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end


  def dashboard

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
