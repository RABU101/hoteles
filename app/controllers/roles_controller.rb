# Reciben peticiones y devuelven vistas
class RolesController < ApplicationController
    # GET /roles/nuevo
    def crear
        #mostrar formulario para guardar roles nuevos
        @mi_nombre = "Rodrigo Bravo Urzúa"
        @rol = Rol.new
    end
    # POST /roles
    def guardar
        # Extraer los datos del params
        datos_rol = params.require(:rol).permit(:rol)
        # Asignando los datos en un nuevo rol
        @nuevo_rol = Rol.new(datos_rol)
        if @nuevo_rol.save
            # por verdad mostrar algo redirect_to
        else
            # sino, tomar prestada una vista render
        end
    end
end