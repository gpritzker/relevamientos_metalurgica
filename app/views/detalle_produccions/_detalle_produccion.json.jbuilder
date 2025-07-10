json.extract! detalle_produccion, :id, :parte_produccion_id, :descripcion, :componente, :cantidad_a_ejecutar, :cantidad_ejecutada, :aceptados, :rechazados, :hora_inicio, :hora_fin, :tiempo_empleado, :observaciones, :created_at, :updated_at
json.url detalle_produccion_url(detalle_produccion, format: :json)
