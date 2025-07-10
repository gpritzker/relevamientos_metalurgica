class CreateTipoObras < ActiveRecord::Migration[7.1]
  def change
    create_table :tipo_obras do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
