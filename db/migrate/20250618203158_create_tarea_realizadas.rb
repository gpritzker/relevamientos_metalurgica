class CreateTareaRealizadas < ActiveRecord::Migration[7.1]
  def change
    create_table :tarea_realizadas do |t|
      t.references :parte_diario, null: false, foreign_key: true
      t.string :descripcion
      t.string :tarea_realizada
      t.integer :cantidad_ejecutada
      t.string :nro_modulo
      t.datetime :hora_inicio
      t.datetime :hora_fin
      t.boolean :en_proceso
      t.boolean :finalizado
      t.text :observaciones

      t.timestamps
    end
  end
end
