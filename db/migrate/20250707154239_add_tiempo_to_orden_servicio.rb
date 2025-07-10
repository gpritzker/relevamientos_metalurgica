class AddTiempoToOrdenServicio < ActiveRecord::Migration[7.1]
  def change
    add_column :orden_servicios, :tiempo, :string
  end
end
