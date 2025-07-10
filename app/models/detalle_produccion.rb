class DetalleProduccion < ApplicationRecord
  belongs_to :parte_produccion, inverse_of: :detalle_produccions
  belongs_to :orden_servicio
end
