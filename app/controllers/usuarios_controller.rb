class UsuariosController < ApplicationController
  layout 'layout_cliente'
  before_action :valida_sesion_sin_redirigir, only: [:mostra, :cerrar_sesion]
  
  # GET /usuario/id
  def mostrar
    @texto_boton = "Actualizar Usuaro"
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
      @usuario = Usuario.new
      @texto = "Iniciar Sesion"
  end

end
