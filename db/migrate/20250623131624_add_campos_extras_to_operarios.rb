class AddCamposExtrasToOperarios < ActiveRecord::Migration[6.1]
  def change
    add_column :operarios, :fecha_nacimiento, :date
    add_column :operarios, :fecha_ingreso, :date
    add_column :operarios, :sexo, :integer, default: 0
    add_column :operarios, :obra_social, :string
    add_column :operarios, :cuil, :string
    add_column :operarios, :cbu, :string
    add_column :operarios, :domicilio, :string
    add_column :operarios, :telefono, :string
    add_column :operarios, :ciudad, :string
    add_column :operarios, :categoria, :string
    add_column :operarios, :sindicalizado, :boolean, default: false
    add_column :operarios, :residente, :boolean, default: false
  end
end
