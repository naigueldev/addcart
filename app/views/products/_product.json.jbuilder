json.extract! product, :id, :name, :price, :image_url, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
