class Hotel < ApplicationRecord
    belongs_to  :ciudad 
    has_many    :habitaciones

    validates :nombre, presence: true
    validates :estrellas, presence: true
    validates :ciudad_id, presence: true
  end

  #belong_to: tiene uno
  #has_many: tiene muchos