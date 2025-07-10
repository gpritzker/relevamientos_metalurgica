class CreateTipoOrdenServicios < ActiveRecord::Migration[7.1]
  def change
    create_table :tipo_orden_servicios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
