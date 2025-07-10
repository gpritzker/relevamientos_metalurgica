class CreateProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
