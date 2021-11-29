class ReservaMailer < ApplicationMailer
    def enviar_confirmacion
        @greeting = "Hola desde rails"
        mail to: "rrodriguez@edutecno.com" #a quién le vamos a enviar
    end
end