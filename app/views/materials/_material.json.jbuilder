json.extract! material, :id, :nombre, :unidad, :stock_actual, :stock_minimo, :observaciones, :created_at, :updated_at
json.url material_url(material, format: :json)
