# Reciben peticiones y devuelven vistas
class CiudadesController < ApplicationController
    # GET /ciudades
    def listar
        @ciudades = Ciudad.all
    end
    # GET /ciudades/nuevo
    def crear
        @ciudad = Ciudad.new
    end
    # POST /ciudades
    def guardar
        # Extraer los datos por params y construlle un hash
        #                       ciudad[nombre]
        datos_ciudad = params.require(:ciudad).permit(:nombre)
        # nuevo_ciudad = {nombre: Tokio}
        #@nuevo_ciudad = Ciudad.new
        #@nuevo_ciudad.nombre = datos_ciudad[:nombre]
        @nuevo_ciudad = Ciudad.new(datos_ciudad)
        if @nuevo_ciudad.save
            # por verdad mostrar algo redirect_to
            puts ">GUARDADO<".center(20,"*")
            redirect_to ciudades_path  # => /ciudad <- GET
        else
            # sino, tomar prestada una vista render
        end
    end
end