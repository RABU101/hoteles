class Usuario < ApplicationRecord
    has_secure_password     #método para decir que guarde la password encriptada

    belongs_to  :rol
    has_many    :reservas
    has_many    :habitaciones, through: :reservas

    validates   :nombre,          presence: true
    validates   :identificacion,  presence: true
    validates   :telefono,        presence: true
    validates   :rol_id,          presence: true

    # id
    # nombre
    # identificacion
    # telefono
    # password_digest
    # rol_id
    
end
