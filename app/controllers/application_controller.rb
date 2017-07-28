class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :set_cart, :categories, :current_user

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def categories
    Category.all
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
