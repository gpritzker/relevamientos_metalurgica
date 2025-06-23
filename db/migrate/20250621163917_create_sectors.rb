class CreateSectors < ActiveRecord::Migration[7.1]
  def change
    create_table :sectors do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
