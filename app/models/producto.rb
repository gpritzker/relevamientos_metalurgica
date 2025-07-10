class Producto < ApplicationRecord
    has_many :subproductos, dependent: :destroy
end
