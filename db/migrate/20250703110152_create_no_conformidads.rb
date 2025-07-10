class CreateNoConformidads < ActiveRecord::Migration[7.1]
  def change
    create_table :no_conformidads do |t|
      t.references :detalle_produccion, null: false, foreign_key: true
      t.string :motivo
      t.integer :cantidad_afectada
      t.text :observaciones

      t.timestamps
    end
  end
end
