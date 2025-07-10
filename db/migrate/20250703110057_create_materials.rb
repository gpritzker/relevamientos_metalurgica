class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :nombre
      t.string :unidad
      t.integer :stock_actual
      t.integer :stock_minimo
      t.text :observaciones

      t.timestamps
    end
  end
end
