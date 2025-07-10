class CreateDocumentoProyectos < ActiveRecord::Migration[7.1]
  def change
    create_table :documento_proyectos do |t|
      t.references :proyecto, null: false, foreign_key: true
      t.string :nombre
      t.boolean :presente
      t.text :observaciones

      t.timestamps
    end
  end
end
