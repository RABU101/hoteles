class ReservasController < ApplicationController
    layout 'layout_cliente'
    before_action :valida_sesion_redirigiendo_al_registro
    # cuando no exista la sesón debe enviarme a registro

    # GET /reserva/:id_habitacion
    def nueva
        #if cookies[:usuario_id]
        if session[:usuario_id]
            @habitacion = Habitacion.find(params[:id_habitacion])
            @usuario = Usuario.find(session[:usuario_id])
            @reserva = Reserva.new
        else
            #falta mensaje de error cuando cookies[:usuario_id] es nil
            redirect_to root_path
        end    
    end
    
    # POST /reservas/:id_habitacion
    def guardar
        @reserva = Reserva.new(params_reserva) #() porque viene de la url
        @reserva.habitacion_id = params[:id_habitacion] #[] porque viene del formulario
        @reserva.usuario_id = session[:usuario_id]
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