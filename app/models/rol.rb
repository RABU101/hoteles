class Rol < ApplicationRecord
    has_many :usuarios

    validates :rol, presence: true
    validates :rol, uniqueness: true
end

#has_many: tiene muchos