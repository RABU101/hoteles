class Habitacion < ApplicationRecord
    belongs_to  :hotel
    has_many    :reservas
    has_many    :usuarios, through: :reservas

    before_validation :capitalizar_nombre

    #has_one_attached :foto_portada
  
    has_many_attached :fotos
  

    validates :nombre   , presence: true
    validates :precio   , presence: true
    validates :hotel_id , presence: true

    private
    def capitalizar_nombre
        self.nombre = self.nombre.split(" ").map(&:capitalize).join(" ")
    end  
  end
