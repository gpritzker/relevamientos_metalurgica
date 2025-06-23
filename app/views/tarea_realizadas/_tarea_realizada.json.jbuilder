json.extract! tarea_realizada, :id, :parte_diario_id, :descripcion, :tarea_realizada, :cantidad_ejecutada, :nro_modulo, :hora_inicio, :hora_fin, :en_proceso, :finalizado, :observaciones, :created_at, :updated_at
json.url tarea_realizada_url(tarea_realizada, format: :json)
