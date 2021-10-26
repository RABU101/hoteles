class Habitacion < ApplicationRecord
    belongs_to :hotel
    has_many :reservas
    has_many :usuarios, through: :reservas
  end

  #belong_to: tiene uno
  #has_many: tiene muchos