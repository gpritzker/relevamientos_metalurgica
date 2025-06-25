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

ActiveRecord::Schema[7.1].define(version: 2025_06_25_171922) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "sectors", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "operarios", "categoria", column: "categoria_id"
  add_foreign_key "operarios", "empresas"
  add_foreign_key "parte_diarios", "operarios"
  add_foreign_key "parte_diarios", "sectors"
  add_foreign_key "parte_diarios", "usuarios"
  add_foreign_key "tarea_realizadas", "operarios"
  add_foreign_key "tarea_realizadas", "parte_diarios"
  add_foreign_key "tiempo_muertos", "parte_diarios"
  add_foreign_key "tiempo_muertos", "tipo_tiempo_muertos"
end
