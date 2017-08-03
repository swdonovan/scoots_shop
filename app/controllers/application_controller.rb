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
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def session_check?(user_id)
    session[:user_id] == user_id.to_i || current_admin
  end
end
