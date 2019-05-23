json.extract! address, :id, :latitude, :longitude, :description, :updated_at, :created_at, :provider_id
json.url provider_branch_offices_url(address.provider_id, address, format: :json)
