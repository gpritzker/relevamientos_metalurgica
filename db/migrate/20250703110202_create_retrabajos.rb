class CreateRetrabajos < ActiveRecord::Migration[7.1]
  def change
    create_table :retrabajos do |t|
      t.references :detalle_produccion, null: false, foreign_key: true
      t.string :motivo
      t.text :descripcion

      t.timestamps
    end
  end
end
