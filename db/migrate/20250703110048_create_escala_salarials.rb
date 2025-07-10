class CreateEscalaSalarials < ActiveRecord::Migration[7.1]
  def change
    create_table :escala_salarials do |t|
      t.string :categoria
      t.decimal :sueldo_base
      t.text :observaciones

      t.timestamps
    end
  end
end
