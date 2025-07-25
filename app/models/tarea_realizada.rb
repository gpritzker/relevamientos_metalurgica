class TareaRealizada < ApplicationRecord
  belongs_to :parte_diario
  belongs_to :operario, optional: true

  validates :descripcion, :hora_inicio, :hora_fin, :cantidad_ejecutada, :nro_modulo, :unidad, presence: true
end