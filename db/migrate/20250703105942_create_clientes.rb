class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :cuit
      t.string :email
      t.string :telefono
      t.string :direccion
      t.text :observaciones

      t.timestamps
    end
  end
end
