class Cartship < ApplicationRecord
  belongs_to :product
  belongs_to :cart


  def add_item
    # current_item = cart.cartships.find_by_product_id(product_id)
    # current_item = cart.cartships.where('product_id = ?', product_id).first
    self.quantity = self.quantity + 1
  end

end
