class CreateSubproductos < ActiveRecord::Migration[7.1]
  def change
    create_table :subproductos do |t|
      t.string :nombre
      t.references :producto, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true

      t.timestamps
    end
  end
end
