class TareaRealizada < ApplicationRecord
  belongs_to :parte_diario
   belongs_to :operario, optional: true
end