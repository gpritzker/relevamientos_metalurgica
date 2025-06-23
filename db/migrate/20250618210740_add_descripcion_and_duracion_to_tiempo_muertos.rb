class AddDescripcionAndDuracionToTiempoMuertos < ActiveRecord::Migration[7.1]
  def change
    #add_column :tiempo_muertos, :descripcion, :string
    add_column :tiempo_muertos, :duracion_minutos, :integer
  end
end
