json.extract! cliente, :id, :nombre, :cuit, :email, :telefono, :direccion, :observaciones, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
