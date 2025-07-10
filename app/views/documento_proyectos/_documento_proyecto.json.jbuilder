json.extract! documento_proyecto, :id, :proyecto_id, :nombre, :presente, :observaciones, :created_at, :updated_at
json.url documento_proyecto_url(documento_proyecto, format: :json)
