json.extract! product, 'id', 'name', 'tags', 'description', 
'trademark', 'measurement_unit', 'price',
'estimated_delivery_time', 'provider_id', 'currency',
# custom display attributes
'category_description', 'formatted_price'
# json.url product_url(product, format: :json)