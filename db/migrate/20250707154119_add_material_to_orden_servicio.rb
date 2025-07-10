class AddMaterialToOrdenServicio < ActiveRecord::Migration[7.1]
  def change
    add_reference :orden_servicios, :material, null: true, foreign_key: true
  end
end
