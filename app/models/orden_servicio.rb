class OrdenServicio < ApplicationRecord
  belongs_to :proyecto
  has_many :proyecto_orden_servicios
  has_many :proyectos, through: :proyecto_orden_servicios
  belongs_to :tipo_orden_servicio, class_name: 'TipoOrdenServicio', optional: true
  has_many :detalle_produccions

  after_create :generar_codigo_orden

  def generar_codigo_orden
    if proyecto.present? && proyecto.cliente.present?
      self.codigo = "ODS-#{proyecto.cliente.id.to_s.rjust(4, '0')}-#{proyecto.id.to_s.rjust(6, '0')}-#{id.to_s.rjust(4, '0')}"
      save!
    end
  end
end
