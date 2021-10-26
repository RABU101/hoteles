class Rol < ApplicationRecord
    has_many :usuarios
end

#has_many: tiene muchos