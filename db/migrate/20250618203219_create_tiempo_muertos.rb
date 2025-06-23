class CreateTiempoMuertos < ActiveRecord::Migration[7.1]
  def change
    create_table :tiempo_muertos do |t|
      t.references :parte_diario, null: false, foreign_key: true
      t.references :tipo_tiempo_muerto, null: false, foreign_key: true
      t.datetime :hora_inicio
      t.datetime :hora_fin
      t.text :observaciones

      t.timestamps
    end
  end
end
