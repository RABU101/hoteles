class Hotel < ApplicationRecord
    belongs_to :ciudad
  
    has_many :habitaciones
  end

  #belong_to: tiene uno
  #has_many: tiene muchos