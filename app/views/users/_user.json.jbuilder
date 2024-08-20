json.extract! user, :id, :firstname, :lastname, :country, :created_at, :updated_at
json.url user_url(user, format: :json)
