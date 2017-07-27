class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end
end
