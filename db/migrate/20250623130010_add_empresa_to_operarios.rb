class AddEmpresaToOperarios < ActiveRecord::Migration[7.1]
  def change
    add_reference :operarios, :empresa, null: true, foreign_key: true
  end
end
