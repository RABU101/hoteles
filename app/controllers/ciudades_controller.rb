# Reciben peticiones y devuelven vistas
class CiudadesController < ApplicationController
    # GET /ciudades
    def listar
        @ciudades = Ciudad.all
    end
    # GET /ciudades/nuevo
    def crear
        #mostrar formulario para guardar roles nuevos
        @ciudad = Ciudad.new
    end
    # POST /ciudades
    def guardar
        # Extraer los datos del params
        datos_ciudad = params.require(:ciudad).permit(:nombre)
        # Asignando los datos en un nuevo rol
        @nuevo_ciudad = Ciudad.new(datos_ciudad)
        if @nuevo_ciudad.save
            # por verdad mostrar algo redirect_to
            redirect_to ciudades_path  # => /ciudad <- GET
        else
            # sino, tomar prestada una vista render
        end
    end
end