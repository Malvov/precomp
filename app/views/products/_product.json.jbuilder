json.extract! product, :id, :name, :tags, :description, :trademark, :measurement_unit, :estimated_delivery_time, :provider_id, :created_at, :updated_at, :currency
json.url product_url(product, format: :json)
