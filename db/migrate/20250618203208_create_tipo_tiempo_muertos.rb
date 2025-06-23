class CreateTipoTiempoMuertos < ActiveRecord::Migration[7.1]
  def change
    create_table :tipo_tiempo_muertos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
