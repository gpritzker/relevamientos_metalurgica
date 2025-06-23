class ChangeTipoTiempoMuertoIdToNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tiempo_muertos, :tipo_tiempo_muerto_id, true
  end
end
