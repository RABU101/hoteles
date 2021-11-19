class HotelesController < ApplicationController
    before_action :asignar_hotel, only: [:mostrar, :editar, :actualizar, :eliminar]
    before_action :validar_sesion_adminstrador

    # Get /hoteles/nuevo
    def nuevo
        @hotel = Hotel.new
        @ciudades = Ciudad.all   
        @texto = "Crear Hotel" 
        # validad si el parámetro :id_ciudad tiene un id de ciudad desde el botón registrar hotel
        #de la lista de ciudades
        if params[:id_ciudad]   
            @hotel.ciudad_id = params[:id_ciudad]
        end
    end

    # GET /hoteles
    def listar
        @lista_hoteles = Hotel.all
        #@ciudades =Ciudad.all

    end

    # GET /hoteles/_id
    def mostrar
        @texto = ", [CIUDAD]"
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
        @hotel.foto_portada = params_hotel[:foto_portada]
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
        flash[:error_hotel] = "No se puede eliminar el Hotel #{@hotel.nombre}, porque tiene habitaciones registradas"
        redirect_to hoteles_path        
    end
    private 
    # extraer los datos del formulario 📦
    def asignar_hotel
        @hotel = Hotel.find_by(id: params[:id])
    end

    def params_hotel
        return params.require(:hotel).permit(:nombre, :estrellas, :ciudad_id, :foto_portada)
    end
end