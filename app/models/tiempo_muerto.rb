class TiempoMuerto < ApplicationRecord
  belongs_to :parte_diario
  belongs_to :tipo_tiempo_muerto, optional: true

  validates :tipo_tiempo_muerto_id, :hora_inicio, :hora_fin, :descripcion, presence: true

  def duracion_minutos
    return 0 unless hora_inicio && hora_fin
    ((hora_fin - hora_inicio) / 60).round
  end

end