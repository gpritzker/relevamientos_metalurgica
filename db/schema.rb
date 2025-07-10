# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_07_07_190802) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "cuit"
    t.string "email"
    t.string "telefono"
    t.string "direccion"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_produccions", force: :cascade do |t|
    t.bigint "parte_produccion_id", null: false
    t.string "descripcion"
    t.string "componente"
    t.integer "cantidad_a_ejecutar"
    t.integer "cantidad_ejecutada"
    t.integer "aceptados"
    t.integer "rechazados"
    t.time "hora_inicio"
    t.time "hora_fin"
    t.integer "tiempo_empleado"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "orden_servicio_id", null: false
    t.string "firma"
    t.index ["orden_servicio_id"], name: "index_detalle_produccions_on_orden_servicio_id"
    t.index ["parte_produccion_id"], name: "index_detalle_produccions_on_parte_produccion_id"
  end

  create_table "documento_proyectos", force: :cascade do |t|
    t.bigint "proyecto_id", null: false
    t.string "nombre"
    t.boolean "presente"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proyecto_id"], name: "index_documento_proyectos_on_proyecto_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escala_salarials", force: :cascade do |t|
    t.string "categoria"
    t.decimal "sueldo_base"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "nombre"
    t.string "unidad"
    t.integer "stock_actual"
    t.integer "stock_minimo"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "no_conformidads", force: :cascade do |t|
    t.bigint "detalle_produccion_id", null: false
    t.string "motivo"
    t.integer "cantidad_afectada"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detalle_produccion_id"], name: "index_no_conformidads_on_detalle_produccion_id"
  end

  create_table "operarios", force: :cascade do |t|
    t.string "nombre"
    t.string "legajo"
    t.string "sector"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "empresa_id"
    t.date "fecha_nacimiento"
    t.date "fecha_ingreso"
    t.integer "sexo", default: 0
    t.string "obra_social"
    t.string "cuil"
    t.string "cbu"
    t.string "domicilio"
    t.string "telefono"
    t.string "ciudad"
    t.string "categoria"
    t.boolean "sindicalizado", default: false
    t.boolean "residente", default: false
    t.bigint "categoria_id"
    t.index ["categoria_id"], name: "index_operarios_on_categoria_id"
    t.index ["empresa_id"], name: "index_operarios_on_empresa_id"
  end

  create_table "orden_servicios", force: :cascade do |t|
    t.bigint "proyecto_id", null: false
    t.bigint "tipo_orden_servicio_id", null: false
    t.string "descripcion"
    t.date "fecha_inicio"
    t.date "fecha_entrega"
    t.string "estado"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subproducto_id"
    t.bigint "sector_id"
    t.bigint "material_id"
    t.string "tiempo"
    t.string "codigo"
    t.index ["material_id"], name: "index_orden_servicios_on_material_id"
    t.index ["proyecto_id"], name: "index_orden_servicios_on_proyecto_id"
    t.index ["sector_id"], name: "index_orden_servicios_on_sector_id"
    t.index ["subproducto_id"], name: "index_orden_servicios_on_subproducto_id"
    t.index ["tipo_orden_servicio_id"], name: "index_orden_servicios_on_tipo_orden_servicio_id"
  end

  create_table "parte_diarios", force: :cascade do |t|
    t.date "fecha"
    t.string "sector"
    t.string "turno"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descripcion"
    t.time "hora_inicio"
    t.time "hora_fin"
    t.text "observacion"
    t.bigint "operario_id"
    t.bigint "sector_id"
    t.index ["operario_id"], name: "index_parte_diarios_on_operario_id"
    t.index ["sector_id"], name: "index_parte_diarios_on_sector_id"
    t.index ["usuario_id"], name: "index_parte_diarios_on_usuario_id"
  end

  create_table "parte_produccions", force: :cascade do |t|
    t.date "fecha"
    t.integer "jornada_laboral"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sector_id", null: false
    t.index ["sector_id"], name: "index_parte_produccions_on_sector_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proyecto_orden_servicios", force: :cascade do |t|
    t.bigint "proyecto_id", null: false
    t.bigint "orden_servicio_id", null: false
    t.bigint "sector_id", null: false
    t.bigint "subproducto_id", null: false
    t.bigint "material_id", null: false
    t.string "descripcion"
    t.string "tiempo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_proyecto_orden_servicios_on_material_id"
    t.index ["orden_servicio_id"], name: "index_proyecto_orden_servicios_on_orden_servicio_id"
    t.index ["proyecto_id"], name: "index_proyecto_orden_servicios_on_proyecto_id"
    t.index ["sector_id"], name: "index_proyecto_orden_servicios_on_sector_id"
    t.index ["subproducto_id"], name: "index_proyecto_orden_servicios_on_subproducto_id"
  end

  create_table "proyectos", force: :cascade do |t|
    t.string "nombre"
    t.bigint "cliente_id", null: false
    t.bigint "tipo_obra_id", null: false
    t.string "ubicacion"
    t.string "plazo_contrato"
    t.text "documentacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo_proyecto"
    t.index ["cliente_id"], name: "index_proyectos_on_cliente_id"
    t.index ["tipo_obra_id"], name: "index_proyectos_on_tipo_obra_id"
  end

  create_table "retrabajos", force: :cascade do |t|
    t.bigint "detalle_produccion_id", null: false
    t.string "motivo"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detalle_produccion_id"], name: "index_retrabajos_on_detalle_produccion_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subproductos", force: :cascade do |t|
    t.string "nombre"
    t.bigint "producto_id", null: false
    t.bigint "sector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_subproductos_on_producto_id"
    t.index ["sector_id"], name: "index_subproductos_on_sector_id"
  end

  create_table "tarea_realizadas", force: :cascade do |t|
    t.bigint "parte_diario_id", null: false
    t.string "descripcion"
    t.string "tarea_realizada"
    t.integer "cantidad_ejecutada"
    t.string "nro_modulo"
    t.datetime "hora_inicio"
    t.datetime "hora_fin"
    t.boolean "en_proceso"
    t.boolean "finalizado"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unidad"
    t.bigint "operario_id"
    t.index ["operario_id"], name: "index_tarea_realizadas_on_operario_id"
    t.index ["parte_diario_id"], name: "index_tarea_realizadas_on_parte_diario_id"
  end

  create_table "tiempo_muertos", force: :cascade do |t|
    t.bigint "parte_diario_id", null: false
    t.bigint "tipo_tiempo_muerto_id"
    t.datetime "hora_inicio"
    t.datetime "hora_fin"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descripcion"
    t.integer "duracion_minutos"
    t.index ["parte_diario_id"], name: "index_tiempo_muertos_on_parte_diario_id"
    t.index ["tipo_tiempo_muerto_id"], name: "index_tiempo_muertos_on_tipo_tiempo_muerto_id"
  end

  create_table "tipo_obras", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_orden_servicios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_tiempo_muertos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "detalle_produccions", "orden_servicios"
  add_foreign_key "detalle_produccions", "parte_produccions"
  add_foreign_key "documento_proyectos", "proyectos"
  add_foreign_key "no_conformidads", "detalle_produccions"
  add_foreign_key "operarios", "categoria", column: "categoria_id"
  add_foreign_key "operarios", "empresas"
  add_foreign_key "orden_servicios", "materials"
  add_foreign_key "orden_servicios", "proyectos"
  add_foreign_key "orden_servicios", "sectors"
  add_foreign_key "orden_servicios", "subproductos"
  add_foreign_key "orden_servicios", "tipo_orden_servicios"
  add_foreign_key "parte_diarios", "operarios"
  add_foreign_key "parte_diarios", "sectors"
  add_foreign_key "parte_diarios", "usuarios"
  add_foreign_key "parte_produccions", "sectors"
  add_foreign_key "proyecto_orden_servicios", "materials"
  add_foreign_key "proyecto_orden_servicios", "orden_servicios"
  add_foreign_key "proyecto_orden_servicios", "proyectos"
  add_foreign_key "proyecto_orden_servicios", "sectors"
  add_foreign_key "proyecto_orden_servicios", "subproductos"
  add_foreign_key "proyectos", "clientes"
  add_foreign_key "proyectos", "tipo_obras"
  add_foreign_key "retrabajos", "detalle_produccions"
  add_foreign_key "subproductos", "productos"
  add_foreign_key "subproductos", "sectors"
  add_foreign_key "tarea_realizadas", "operarios"
  add_foreign_key "tarea_realizadas", "parte_diarios"
  add_foreign_key "tiempo_muertos", "parte_diarios"
  add_foreign_key "tiempo_muertos", "tipo_tiempo_muertos"
end
