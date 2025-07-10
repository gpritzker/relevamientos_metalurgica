class CreateProyectoOrdenServicios < ActiveRecord::Migration[7.1]
  def change
    create_table :proyecto_orden_servicios do |t|
      t.references :proyecto, null: false, foreign_key: true
      t.references :orden_servicio, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true
      t.references :subproducto, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.string :descripcion
      t.string :tiempo

      t.timestamps
    end
  end
end
