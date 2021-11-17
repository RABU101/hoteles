class HabitacionesController < ApplicationController

    before_action :asignar_habitacion, only: [:mostrar, :editar, :actualizar, :eliminar]
    
    # GET /habitaciones
    def listar
        @habitaciones = Habitacion.all
    end

    # GET /habitaciones/nueva
    def nueva
        @habitacion = Habitacion.new
        @hoteles = Hotel.all
        @texto_boton = "Registrar Habitación"
        if params[:id_hotel]
            @habitacion.hotel_id = params[:id_hotel]
            #if params[:parent_hotel_id]
            #    redirect_to mostrar_hotel(params[:parent_hotel_id])
            #end
        end
    end

    # GET /habitaciones/:id
    def mostrar        
    end

    # GET /habitaciones/:id/editar
    def editar
        @hoteles = Hotel.all
        @texto_boton = "Actualizar habitación"
    end

    # POST /habitaciones
    def guardar
        @habitacion = Habitacion.new(params_habitacion)
        if @habitacion.save
            redirect_to habitaciones_path
        else
            @hoteles = Hotel.all
            @texto_boton = "Registrar habitación"
            render :nueva
        end
    end

    # PATH/PUT /habitaciones/:id
    def actualizar
        @habitacion.nombre          = params_habitacion[:nombre]
        @habitacion.esta_reservada  = params_habitacion[:esta_reservada]
        @habitacion.precio          = params_habitacion[:precio]
        @habitacion.hotel_id        = params_habitacion[:hotel_id]
        @habitacion.fotos           = params_habitacion[:fotos]

        puts ">>>>><<<<<"
        if @habitacion.save
            redirect_to habitaciones_path
        else
            @hoteles = Hotel.all
            @texto_boton = "Actualizar habitación"
            render :editar
        end
    end

    # DELETE /habitaciones/:id
    def eliminar
        @habitacion.destroy
        redirect_to habitaciones_path
    end

    private
    def params_habitacion
        return params.require(:habitacion).permit(:nombre, :precio, :esta_reservada, :hotel_id, fotos: [])
    end

    def asignar_habitacion
        @habitacion = Habitacion.find_by(id: params[:id])
    end

end