class Proyecto < ApplicationRecord
  belongs_to :cliente
  belongs_to :tipo_obra
  has_many :documento_proyectos
  has_many :orden_servicios, through: :proyecto_orden_servicios
  has_many :proyecto_orden_servicios, inverse_of: :proyecto, dependent: :destroy
  accepts_nested_attributes_for :proyecto_orden_servicios, allow_destroy: true
  has_many :documentos_proyecto, class_name: 'DocumentoProyecto', dependent: :destroy
  accepts_nested_attributes_for :documentos_proyecto, allow_destroy: true, reject_if: ->(attrs) { attrs['presente'] != 'true' }

  after_create :crear_documentos_base

  def crear_documentos_base
    [
      'Planta',
      'Cortes',
      'Vistas',
      'Plano Eléctrico',
      'Esquema unifilar',
      'Planilla de consumos',
      'Planta sanitario',
      'Plano de agua',
      '3D',
      'Instructivo de montaje',
      'Computo mano de obra',
      'Conforme a obra y computo real de materiales',
      'Plan de trabajo',
      'Control presupuestario, mano de obra y materiales',
      'Calculo de estructura',
      'Armado carpeta digital',
      'Armado carpeta jefe de taller y jefes de areas',
      'Armado planilla producción'
    ].each do |nombre|
      self.documento_proyectos.create(nombre: nombre.strip, presente: false)
    end
  end
end 