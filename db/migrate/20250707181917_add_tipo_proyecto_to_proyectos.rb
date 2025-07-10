class AddTipoProyectoToProyectos < ActiveRecord::Migration[7.1]
  def change
    add_column :proyectos, :tipo_proyecto, :string
  end
end
