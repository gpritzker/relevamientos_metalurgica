class RemoveOrdenServicioIdFromParteProduccions < ActiveRecord::Migration[7.1]
  def change
    remove_column :parte_produccions, :orden_servicio_id, :integer
  end
end
