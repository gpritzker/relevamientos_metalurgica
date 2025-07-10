class AddCodigoToOrdenServicios < ActiveRecord::Migration[7.1]
  def change
    add_column :orden_servicios, :codigo, :string
  end
end
