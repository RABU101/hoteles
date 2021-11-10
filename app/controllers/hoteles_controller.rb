class HotelesController < ApplicationController
    before_action :asignar_hotel, only: [:editar, :actualizar, :eliminar]

    # Get /hoteles/nuevo
    def nuevo
        @hotel = Hotel.new
        @ciudades = Ciudad.all   
        @texto = "Crear Hotel"    
    end

    # GET /hoteles
    def listar
        @lista_hoteles = Hotel.all
        #@ciudades =Ciudad.all
    end

    # POST /hoteles
    def guardar
        #@hotel = Hotel.new
        #@hotel.nombre = params_hotel[:nombre]
        #@hotel.estrellas = params_hotel[:estrellas]
        #@hotel.ciudad_id = params_hotel[:ciudad]
        @hotel = Hotel.new(params_hotel)
        if @hotel.save
            # por verdad mostrar algo redirect_to
            redirect_to hoteles_path  # => /roles <- GET
        else
            # sino, tomar prestada una vista render
            @ciudades = Ciudad.all
            render :nuevo
        end    
    end

    #GET /hoteles/:id/editar
    def editar
        @ciudades = Ciudad.all
        @texto = "Actualizar Hotel"
    end

    # PATH /hoteles/:id
    def actualizar
        @hotel.nombre = params_hotel[:nombre]
        @hotel.estrellas = params_hotel[:estrellas]
        @hotel.ciudad_id = params_hotel[:ciudad_id]
        if @hotel.save
            redirect_to hoteles_path
        else
            @ciudades = Ciudad.all
            render :editar
        end
    end

    # DELETE /hoteles/:id
    def eliminar
        @hotel.destroy
        redirect_to hoteles_path
    rescue
        flash[:error_hotel] = "No se puede eliminar el hotel #{@hotel.nombre}, porque tiene habitaciones registradas"
        redirect_to hoteles_path        
    end
    private # Todo lo que está abajo 👇👇 es PRIVADO
    # extraer los datos del formulario 📦
    def asignar_hotel
        @hotel = Hotel.find_by(id: params[:id])
        #@ciudades = Ciudad.all
        #puts "ANTES ASIGNAR UN HOTEL".center(50, "🚥")
    end

    def params_hotel
        return params.require(:hotel).permit(:nombre, :estrellas, :ciudad_id)
    end
end