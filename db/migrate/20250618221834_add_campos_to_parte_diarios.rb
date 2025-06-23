class AddCamposToParteDiarios < ActiveRecord::Migration[7.1]
  def change
    #add_column :parte_diarios, :sector, :string
    #add_column :parte_diarios, :operario, :string
    add_column :parte_diarios, :descripcion, :string
    add_column :parte_diarios, :hora_inicio, :time
    add_column :parte_diarios, :hora_fin, :time
    add_column :parte_diarios, :observacion, :text
  end
end
