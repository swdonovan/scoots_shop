class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    if session_check?(@user)
      render 'show'
    else
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(id: @user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_attributes)
      redirect_to dashboard_path(id: @user.id)
    else
      render '404'
    end
  end

  private

  def user_attributes
    params.require(:user).permit(:full_name, :username, :password, :address, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
