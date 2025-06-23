class CreateOperarios < ActiveRecord::Migration[7.1]
  def change
    create_table :operarios do |t|
      t.string :nombre
      t.string :legajo
      t.string :sector
      t.boolean :activo

      t.timestamps
    end
  end
end
