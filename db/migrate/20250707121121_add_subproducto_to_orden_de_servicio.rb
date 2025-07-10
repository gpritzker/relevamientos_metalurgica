class AddSubproductoToOrdenDeServicio < ActiveRecord::Migration[7.1]
  def change
    add_reference :orden_servicios, :subproducto, foreign_key: true, null: true
  end
end
