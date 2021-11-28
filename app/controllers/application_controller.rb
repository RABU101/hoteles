class ApplicationController < ActionController::Base
    def valida_sesion_sin_redirigir
        #if cookies[:usuario_id]
        if session[:usuario_id]
            @usuario_actual = Usuario.find(session[:usuario_id])
        end
    rescue        
        #cookies.delete(:usuario_id)
        #session.delete(:usuario_id)
        session[:usuario_id] = nil
        @usuario_actual = nil
    end
    
    def valida_sesion_redirigiendo_al_registro
        #if cookies[:usuario_id]
        if session[:usuario_id]
            @usuario_actual = Usuario.find(session[:usuario_id])
        else
            redirect_to registro_path
        end
    rescue        
        #cookies.delete(:usuario_id)
        session[:usuario_id] = nil
        redirect_to registro_path
    end
    def valida_sesion_para_el_registro
        #if cookies[:usuario_id]
        if session[:usuario_id]
            redirect_to root_path
        else
            #cookies.delete(:usuario_id)
            session[:usuario_id] = nil
            @usuario_actual = nil            
        end
    end
    
    def validar_sesion_adminstrador
        if session[:usuario_id]
            @usuario_actual = Usuario.find(session[:usuario_id])
            if @usuario_actual.rol != Rol.find_by(rol: 'Administrador')
                redirect_to root_path
            end
        else
            redirect_to root_path
        end  
    rescue
        session[:usuario_id] = nil
        redirect_to root_path
    end

    def not_found
        puts "ERROR 404"
    end
end
