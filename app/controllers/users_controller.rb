class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if session[:user_id] == @user.id
      render 'show'
    else
      session[:user_id] = nil
      redirect_to login_path
    end
  end
end
