json.extract! cartship, :id, :cart_id, :product_id, :quantity, :created_at, :updated_at
json.url cartship_url(cartship, format: :json)
