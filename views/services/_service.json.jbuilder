json.extract! service, :id, :name, :type, :email, :phone, :twitter, :created_at, :updated_at
json.url service_url(service, format: :json)
