class UsuariosController < ApplicationController
  layout 'layout_cliente'
  before_action :valida_sesion_sin_redirigir
  
  # GET /usuario/id
  def mostrar

  end
end
