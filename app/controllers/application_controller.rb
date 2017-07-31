class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :set_cart, :categories, :current_user, :current_admin

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def categories
    Category.all
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def session_check?(user)
    session[:user_id] == user.id
  end
end
