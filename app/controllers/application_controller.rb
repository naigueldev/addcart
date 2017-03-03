class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :load_cart

  def load_cart
    @cart = Cart.find(session[:cart_id]) if session[:cart_id].present?
  end

end
