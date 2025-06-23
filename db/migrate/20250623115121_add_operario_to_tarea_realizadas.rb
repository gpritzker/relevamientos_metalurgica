class AddOperarioToTareaRealizadas < ActiveRecord::Migration[7.1]
  def change
    add_reference :tarea_realizadas, :operario, null: true, foreign_key: true
  end
end
