class ParteProduccion < ApplicationRecord
  #belongs_to :operario
  #belongs_to :orden_servicio
  validate :validar_jornada_laboral
  belongs_to :sector, optional: true
  has_many :detalle_produccions, inverse_of: :parte_produccion, dependent: :destroy
  accepts_nested_attributes_for :detalle_produccions, allow_destroy: true 

  def validar_jornada_laboral
    total = detalle_produccions.sum { |d| d.tiempo_empleado.to_i }

    if jornada_laboral && total != jornada_laboral
      errors.add(:base, "La suma del tiempo no coincide con la jornada laboral")
    end
  end
end
