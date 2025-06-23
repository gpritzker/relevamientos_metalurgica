class AddUnidadToTareaRealizadas < ActiveRecord::Migration[7.1]
  def change
    add_column :tarea_realizadas, :unidad, :string
  end
end
