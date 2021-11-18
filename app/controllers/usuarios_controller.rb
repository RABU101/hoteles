class UsuariosController < ApplicationController
  layout 'layout_cliente'
  before_action :valida_sesion_sin_redirigir, only: [:mostra, :cerrar_sesion]
  before_action :valida_sesion_para_el_registro, only: [:iniciar_sesion]
  
  # GET /usuario/id
  def mostrar
    @texto_boton = "Actualizar Usuario"
  end
  def listar
  end
  # DELETE /cerrar_sesion
  def cerrar_sesion
    session[:usuario_id] = nil
    redirect_to root_path 
  end
  
  # GET /iniciar_sesion
  def iniciar_sesion
      @texto_boton = "Iniciar Sesion"
  end
  # POST /iniciar_sesion
  def crear_sesion
    @texto_boton = "Iniciar Sesion"
    usuario_encontrado = Usuario.find_by(identificacion: params[:identificacion])
    if usuario_encontrado
      if usuario_encontrado.authenticate(params[:password])
        session[:usuario_id] = usuario_encontrado.id
        redirect_to root_path
      else
        # enviar error de contraseña
        flash[:error_iniciar_sesion] = "Password no coincide"
        #redirect_to iniciar_sesion_path
        render :iniciar_sesion
      end
    else
      # enviar error de usuario
      flash[:error_iniciar_sesion] = "Usuario no encontrado"
      #redirect_to iniciar_sesion_path
      render :iniciar_sesion
    end
  end
  private 
  def params_usuario
      return params.require(:usuario).permit(:nombre, :identificacion, :telefono, :password, :password_confirmation)
  end
end
