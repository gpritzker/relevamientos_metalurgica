class TipoTiempoMuerto < ApplicationRecord
  has_many :tiempos_muertos, dependent: :destroy
end