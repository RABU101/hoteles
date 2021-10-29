# Reciben peticiones y devuelven vistas
class RolesController < ApplicationController
    # GET /roles
    def listar
        @roles = Rol.all
    end
    # GET /roles/nuevo
    def crear
        #mostrar formulario para guardar roles nuevos
        #@mi_nombre = "Rodrigo Bravo Urzúa"
        @rol = Rol.new
    end
    # POST /roles
    def guardar
        # Extraer los datos del params
        datos_rol = params.require(:rol).permit(:rol)
        # Asignando los datos en un nuevo rol
        @rol = Rol.new(datos_rol)
        if @rol.save
            # por verdad mostrar algo redirect_to
            redirect_to roles_path  # => /roles <- GET
        else
            # sino, tomar prestada una vista render
            render :crear
        end
    end
end