class Cart < ApplicationRecord
  has_many :cartships
  has_many :products, through: :cartships

  def total_price
    cartships.map { |cartship| cartship.quantity * cartship.product.price }.sum
  end

  def add_item(product_id, cart)
    # current_item = cart.cartships.find_by_product_id(product_id)
    current_item = cartships.where('product_id = ?', product_id).first

    current_item.quantity += 1

    save
  end
end
