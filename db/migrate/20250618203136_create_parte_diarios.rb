class CreateParteDiarios < ActiveRecord::Migration[7.1]
  def change
    create_table :parte_diarios do |t|
      t.date :fecha
      t.string :sector
      t.string :turno
      t.string :operario
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
