class Habitacion < ApplicationRecord
    belongs_to :hotel
    has_many :reservas
    has_many :usuarios, through: :reservas

    validates :nombre, presence: true
    validates :esta_reserva, presence: true
    validates :precio, presence: true

  end

  #belong_to: tiene uno
  #has_many: tiene muchos