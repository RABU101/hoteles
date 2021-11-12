class ReservasController < ApplicationController
    layout 'layout_cliente'
    # GET /reserva/:id_habitacion
    def nueva
        @habitacion = Habitacion.find(params[:id_habitacion])
        @usuario = Usuario.find(cookies[:usuario_id])
        @reserva = Reserva.new
        
    end
    
    # POST /reservas/:id_habitacion
    def guardar
        @reserva = Reserva.new(params_reserva) #() porque viene de la url
        @reserva.habitacion_id = params[:id_habitacion] #[] porque viene del formulario
        @reserva.usuario_id = cookies[:usuario_id]
        @reserva.codigo = SecureRandom.alphanumeric(5)
puts @Reserva        
        if @reserva.save
            flash[:reserva_creada] = "Su reserva ha sido creada"
            redirect_to root_path
        else
            render :nueva
        end
    end

    private
    def params_reserva
        return params.require(:reserva).permit(:fecha_ingreso, :fecha_salida)
    end
end