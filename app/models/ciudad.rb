class Ciudad < ApplicationRecord
    # Relaciones
    has_many :hoteles
    # Validaciones
    validates :nombre, presence: true
    validates :nombre, uniqueness: true
end

#has_many: tiene muchos
