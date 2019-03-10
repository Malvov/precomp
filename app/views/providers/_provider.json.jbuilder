json.extract! provider, :id, :name, :contact, :max_product_quantity, :subscription_end_date, :phone, :personal_contact, :administrative_contact, :email, :webpage_link, :address, :is_active, :created_at, :updated_at
json.url provider_url(provider, format: :json)
