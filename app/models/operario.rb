class Operario < ApplicationRecord
    has_many :tarea_realizadas, class_name: 'TareaRealizada', foreign_key: 'operario_id'
    belongs_to :categoria, class_name: 'Categorium', optional: true
    belongs_to :empresa, optional: true  
    has_many :parte_diarios, class_name: 'ParteDiario', foreign_key: 'operario_id'
end
