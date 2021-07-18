json.extract! order, :id, :address, :city, :state, :user_id, :product_id, :created_at, :updated_at
json.url order_url(order, format: :json)
