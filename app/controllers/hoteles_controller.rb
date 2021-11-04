class HotelesController < ApplicationController

    # Get /hoteles/nuevo
    def nuevo
        @hotel = Hotel.new
        @ciudades = Ciudad.all        
    end

    # GET /hoteles
    def listar
        
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
            render :nuevo
        end    
    end

    private # Todo lo que está abajo 👇👇 es PRIVADO
    # extraer los datos del formulario 📦
    def params_hotel
        return params.require(:hotel).permit(:nombre, :estrellas, :ciudad_id)
    end
end