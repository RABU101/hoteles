class RegistrosController < ApplicationController
    layout 'layout_cliente'

    # GET /registro
    def nuevo
        @usuario = Usuario.new
        @texto = "Crear Usuario" 
    end    
    
    # POST /registros
    def guardar
        @usuario = Usuario.new(params_usuario)
        @usuario.rol = Rol.find_by(rol: 'Cliente')
        if @usuario.save
            cookies[:usuario_id] = @usuario.id   #Define la cookie que mantendra la sesión
            redirect_to root_path
        else
            render :nuevo
        end
    end

    private 

    def params_usuario
        return params
        .require(:usuario)
        .permit(:nombre, :identificacion, :telefono, :password, :password_confirmation)
    end

end