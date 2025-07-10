class CreateParteProduccions < ActiveRecord::Migration[7.1]
  def change
    create_table :parte_produccions do |t|
      t.references :operario, null: false, foreign_key: true
      t.references :orden_servicio, null: false, foreign_key: true
      t.date :fecha
      t.integer :jornada_laboral
      t.text :observaciones

      t.timestamps
    end
  end
end
