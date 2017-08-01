class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Logged in successfully'
      admin_redirect
    else
      flash[:danger] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out successfully'
    redirect_to root_path
  end

  def admin_redirect
    if @user.admin?
      redirect_to admin_dashboard_path(id: @user.id)
    else
      redirect_to dashboard_path(id: @user.id)
    end
  end
end
