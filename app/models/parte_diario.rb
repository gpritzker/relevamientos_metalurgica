class ParteDiario < ApplicationRecord
  belongs_to :usuario
  belongs_to :sector
  belongs_to :operario
  has_many :tareas_realizadas, dependent: :destroy, class_name: 'TareaRealizada'
  #has_many :tipo_tiempo_muertos, dependent: :destroy, class_name: 'TipoTiempoMuerto'
  has_many :tiempos_muertos, dependent: :destroy, class_name: 'TiempoMuerto'
  accepts_nested_attributes_for :tiempos_muertos, allow_destroy: true, reject_if: ->(attrs) {
    attrs['tipo_tiempo_muerto_id'].blank? &&
    attrs['descripcion'].blank? &&
    attrs['observaciones'].blank? &&
    attrs['hora_inicio'].blank? &&
    attrs['hora_fin'].blank?
  }
  accepts_nested_attributes_for :tareas_realizadas, allow_destroy: true, reject_if: ->(attrs) {
    attrs['descripcion'].blank? &&
    attrs['cantidad_ejecutada'].blank? &&
    attrs['unidad'].blank? &&
    attrs['nro_modulo'].blank? &&
    attrs['hora_inicio'].blank? &&
    attrs['hora_fin'].blank?
  }

  validates :fecha, :hora_inicio, :hora_fin, :usuario, :sector, :operario, presence: true
  validates_associated :tareas_realizadas, :tiempos_muertos

  validate :validar_jornada_laboral

  private

  def validar_jornada_laboral
    return if hora_inicio.blank? || hora_fin.blank?

    jornada = (hora_fin - hora_inicio) / 60.0

    total_tareas = tareas_realizadas.reject(&:marked_for_destruction?).sum do |t|
      calcular_minutos(t.hora_inicio, t.hora_fin)
    end

    total_tiempos_muertos = tiempos_muertos.reject(&:marked_for_destruction?).sum do |tm|
      calcular_minutos(tm.hora_inicio, tm.hora_fin)
    end

    if total_tareas + total_tiempos_muertos > jornada
      errors.add(:base, 'La sumatoria de las horas de tareas y tiempos muertos no puede exceder la jornada laboral')
    end
  end

  def calcular_minutos(inicio, fin)
    return 0 if inicio.blank? || fin.blank?
    (fin - inicio) / 60.0
  end
end