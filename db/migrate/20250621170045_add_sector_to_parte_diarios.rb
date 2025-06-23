class AddSectorToParteDiarios < ActiveRecord::Migration[7.1]
  def change
    add_reference :parte_diarios, :sector, foreign_key: true
  end
end
