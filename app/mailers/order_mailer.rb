class OrderMailer < ApplicationMailer

    # como controladores
    def enviar_correo
      @variable = params[:variable]                             # para recibir variables y pasarlas a las "vistas"
      mail(to: 'rabu.networking@gmail.com', subjuect: 'prueba')  # este método es el que envía el correo 
    end
  end