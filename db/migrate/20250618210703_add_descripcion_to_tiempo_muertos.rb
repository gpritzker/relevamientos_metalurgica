class AddDescripcionToTiempoMuertos < ActiveRecord::Migration[7.1]
  def change
    add_column :tiempo_muertos, :descripcion, :string
  end
end
