json.extract! product, :id, :name, :tag, :description, :trademark, :measurement_unit, :estimated_delivery_time, :providers_id, :created_at, :updated_at
json.url product_url(product, format: :json)
