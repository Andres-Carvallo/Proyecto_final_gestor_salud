json.extract! client, :id, :name, :email, :phone_number, :rut, :service_price, :paid_out, :created_at, :updated_at
json.url client_url(client, format: :json)
