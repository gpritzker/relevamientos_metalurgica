class AddSectorToOrdenServicio < ActiveRecord::Migration[7.1]
  def change
    add_reference :orden_servicios, :sector, null: true, foreign_key: true
  end
end
