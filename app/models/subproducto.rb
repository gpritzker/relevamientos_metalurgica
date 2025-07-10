class Subproducto < ApplicationRecord
  belongs_to :producto, class_name: "Producto"
  belongs_to :sector, class_name: "Sector"
  has_many :orden_servicio
end
