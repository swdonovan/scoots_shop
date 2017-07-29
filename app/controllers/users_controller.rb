class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(id: @user.id)
    else
    end
  end

  private

  def user_attributes
    params.require(:user).permit(:username, :password, :address, :email)
  end
end
