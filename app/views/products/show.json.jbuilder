@product_as_json['formatted_price'] = formatted_price @product
json.partial! "products/product", product: @product_as_json
