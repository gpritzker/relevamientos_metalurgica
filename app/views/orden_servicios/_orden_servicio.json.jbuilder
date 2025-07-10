json.extract! orden_servicio, :id, :proyecto_id, :tipo_orden_servicio_id, :descripcion, :fecha_inicio, :fecha_entrega, :estado, :observaciones, :created_at, :updated_at
json.url orden_servicio_url(orden_servicio, format: :json)
