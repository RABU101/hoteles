# Reciben peticiones y devuelven vistas
class RolesController < ApplicationController
    before_action :asignar_rol, only: [:editar, :actualizar, :eliminar]

    # GET /roles
    def listar
        @roles = Rol.all
    end
    # GET /roles/nuevo
    def mostrar_formulario_crear
        #mostrar formulario para guardar roles nuevos
        #@mi_nombre = "Rodrigo Bravo Urzúa"
        @rol = Rol.new
        @texto = "Crear Rol"
    end
    # GET /roles/:id/editar
    def editar
        @texto = "Actualizar Rol"
    end
    # POST /roles
    def guardar
        # Extraer los datos del params
        #datos_rol = params.require(:rol).permit(:rol)
        # Asignando los datos en un nuevo rol
        @rol = Rol.new
        @rol.rol = params_rol[:rol]
        if @rol.save
            # por verdad mostrar algo redirect_to
            redirect_to roles_path  # => /roles <- GET
        else
            # sino, tomar prestada una vista render
            render :mostrar_formulario_crear
        end
    end
    # PATH /roles/:id
    def actualizar
        @rol.rol = params_rol[:rol]
        if @rol.save
            redirect_to roles_path
        else
            render :editar
        end
    end
    # DELETE /roles/:id
    def eliminar
        @rol.destroy
        redirect_to roles_path
    end
    private # Todo lo que está abajo 👇👇 es PRIVADO
    
    # recuperamos el :id de la URL 📦 y lo buscamos en la base de datos
    def asignar_rol
        @rol = Rol.find_by(id: params[:id])
        puts "ANTES ASIGNAR UN ROL".center(50, "🚥")
    end
    # extraer los datos del formulario 📦
    def params_rol
        return params.require(:rol).permit(:rol)
    end
end