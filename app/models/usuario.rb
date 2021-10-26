class Usuario < ApplicationRecord
    belongs_to :rol
    has_many :reservas
    has_many :habitaciones, through: :reservas
  end

  #has_many: tiene muchos
  #belong_to: tiene uno
  #through: a traves de