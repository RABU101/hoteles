class UsuariosController < ApplicationController
  layout 'layout_cliente'
  before_action :valida_sesion_sin_redirigir
  
  # GET /usuario/id
  def mostrar
    @texto_boton = "Actualizar Usuaro"
  end
  def listar
  end

end
