class RemoveOperarioIdFromParteProduccions < ActiveRecord::Migration[7.1]
  def change
    remove_column :parte_produccions, :operario_id, :integer
  end
end
