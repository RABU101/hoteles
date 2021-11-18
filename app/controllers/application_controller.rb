class ApplicationController < ActionController::Base
    def valida_sesion_sin_redirigir
        #if cookies[:usuario_id]
        if session[:usuario_id]
            @usuario_actual = Usuario.find(cookies[:usuario_id])
        end
    rescue        
        #cookies.delete(:usuario_id)
        session.delete(:usuario_id)
        @usuario = nil
    end
    
    def valida_sesion_redirigiendo_al_registro
        #if cookies[:usuario_id]
        if session[:usuario_id]
            @usuario_actual = Usuario.find(cookies[:usuario_id])
        else
            redirect_to registro_path
        end
    rescue        
        #cookies.delete(:usuario_id)
        session.delete(:usuario_id)
        redirect_to registro_path
    end
    def valida_sesion_para_el_registro
        #if cookies[:usuario_id]
        if session[:usuario_id]
            redirect_to root_path
        else
            #cookies.delete(:usuario_id)
            session.delete(:usuario_id)
            @usuario_actual = nil            
        end
    end
end
