class ChangeOperarioFieldInParteDiarios < ActiveRecord::Migration[7.1]
 def change
    remove_column :parte_diarios, :operario, :string
    add_reference :parte_diarios, :operario, foreign_key: true
  end
end
