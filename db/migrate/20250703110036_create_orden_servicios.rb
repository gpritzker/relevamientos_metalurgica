class CreateOrdenServicios < ActiveRecord::Migration[7.1]
  def change
    create_table :orden_servicios do |t|
      t.references :proyecto, null: false, foreign_key: true
      t.references :tipo_orden_servicio, null: false, foreign_key: true
      t.string :descripcion
      t.date :fecha_inicio
      t.date :fecha_entrega
      t.string :estado
      t.text :observaciones

      t.timestamps
    end
  end
end
