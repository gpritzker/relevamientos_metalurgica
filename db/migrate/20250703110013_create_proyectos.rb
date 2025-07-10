class CreateProyectos < ActiveRecord::Migration[7.1]
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.references :cliente, null: false, foreign_key: true
      t.references :tipo_obra, null: false, foreign_key: true
      t.string :ubicacion
      t.string :plazo_contrato
      t.text :documentacion

      t.timestamps
    end
  end
end
