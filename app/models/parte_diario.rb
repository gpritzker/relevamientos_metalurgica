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

end