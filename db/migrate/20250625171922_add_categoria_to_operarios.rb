class AddCategoriaToOperarios < ActiveRecord::Migration[7.0]
  def change
    add_reference :operarios, :categoria, foreign_key: { to_table: :categoria }
  end
end