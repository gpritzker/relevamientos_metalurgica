class Subproducto < ApplicationRecord
  belongs_to :producto, class_name: "Producto", optional: true
  belongs_to :sector, class_name: "Sector", optional: true
  has_many :orden_servicio
end
