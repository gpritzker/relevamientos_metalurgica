class AddOrdenServicioAndFirmaToDetalleProduccions < ActiveRecord::Migration[7.1]
  def change
    add_reference :detalle_produccions, :orden_servicio, null: false, foreign_key: true
    add_column :detalle_produccions, :firma, :string
  end
end
