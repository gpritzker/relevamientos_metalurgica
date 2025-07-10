class CreateDetalleProduccions < ActiveRecord::Migration[7.1]
  def change
    create_table :detalle_produccions do |t|
      t.references :parte_produccion, null: false, foreign_key: true
      t.string :descripcion
      t.string :componente
      t.integer :cantidad_a_ejecutar
      t.integer :cantidad_ejecutada
      t.integer :aceptados
      t.integer :rechazados
      t.time :hora_inicio
      t.time :hora_fin
      t.integer :tiempo_empleado
      t.text :observaciones

      t.timestamps
    end
  end
end
