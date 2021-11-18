class ReservasController < ApplicationController
    layout 'layout_cliente'
    before_action :valida_sesion_redirigiendo_al_registro
    # cuando no exista la sesón debe enviarme a registro

    # GET /reserva/:id_habitacion
    def nueva
        #if cookies[:usuario_id]
        #if session[:usuario_id]
            @habitacion = Habitacion.find(params[:id_habitacion])
            #@usuario = Usuario.find(session[:usuario_id])
            @reserva = Reserva.new
        #else
            #falta mensaje de error cuando cookies[:usuario_id] es nil
        #    redirect_to root_path
        #end    
    end
    
    # POST /reservas/:id_habitacion
    def guardar
        @habitacion = Habitacion.find(params[:id_habitacion])       # 1. Obtener el ID del habitación desde params
                                                                    # 2. Obtener el ID del Usuario 👦 desde la session (con el before_action ya se hace)
        @reserva    = Reserva.new(params_reserva)                   # 3. Crear un objeto de tipo Reserva con la fechas del formulario

        @reserva.habitacion = @habitacion                           # 4. Asignar los valores a la reserva
        @reserva.usuario    = @usuario_actual
        @reserva.codigo     = SecureRandom.alphanumeric(5).upcase   # 5. Crear un código de reserva "seguro" alfanumérico

        if @reserva.save                                            # 6. Intentar guardar la reserva en la Base de datos
            flash[:reserva_creada] = "Su reserva ha sido creada"        # 6.1. EXITO => Mostrar un mensaje de validación
            redirect_to root_path                                       # Redirigir a la raíz de la aplicación
        else                                                            # 6.2. FALSO =>
            render :nueva                                               # Mostrar el formulario :nueva para mostrar los errores
        end
    end

    private
    def params_reserva
        return params.require(:reserva).permit(:fecha_ingreso, :fecha_salida)
    end
end