json.extract! restaurant, :id, :owner_id, :name, :restaurant_type, :description, :zip_code_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
