class ProyectoOrdenServicio < ApplicationRecord
  belongs_to :proyecto
  belongs_to :orden_servicio

  belongs_to :sector, optional: true
  belongs_to :subproducto, optional: true
  belongs_to :material, optional: true
end
