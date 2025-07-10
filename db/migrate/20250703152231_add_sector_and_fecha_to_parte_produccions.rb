class AddSectorAndFechaToParteProduccions < ActiveRecord::Migration[7.1]
  def change
    add_reference :parte_produccions, :sector, null: false, foreign_key: true
  end
end
