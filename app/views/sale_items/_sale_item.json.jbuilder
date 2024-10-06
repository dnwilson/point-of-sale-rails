json.extract! sale_item, :id, :product_id, :sale_id, :quantity, :subtotal, :total, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)
