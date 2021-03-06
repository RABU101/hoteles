class CiudadesController < ApplicationController

    before_action :asignar_ciudad, only: [:mostrar, :editar, :actualizar, :eliminar]
    before_action :validar_sesion_adminstrador

    # GET /ciudades
    def listar
        #@lista_ciudades = Ciudad.all
        @lista_ciudades = Ciudad.includes(:hoteles)
    end

    # GET /ciudades/nuevo
    def mostrar_formulario_crear
        @ciudad = Ciudad.new
        @texto = "Crear Ciudad"
    end

    # GET /ciudad/:id
    def mostrar
       #@hoteles = Hoteles.find_by()
    end

    # GET /ciudades/:id/editar
    def editar
        @texto = "Actualizar Ciudad"
    end

    # POST /ciudades
    def guardar
        # Guardando los datos 💾
        @ciudad = Ciudad.new
        @ciudad.nombre = params_ciudad[:nombre]
        if @ciudad.save
            # redirect_to "/ciudades"
            redirect_to ciudades_path
        else
            render :mostrar_formulario_crear
        end
    end

    # PATH /ciudades/:id
    def actualizar
        @ciudad.nombre = params_ciudad[:nombre]
        if @ciudad.save
            redirect_to ciudades_path
        else
            render :editar
        end
    end

    # DELETE /ciudades/:id
    def eliminar
        @ciudad.destroy
        redirect_to ciudades_path
        # rescata el código del error especifficado
        #rescue ActiveRecord::InvalidForeignKey
        #puts "recata error"
    #rescue, rescata todos los errores posibles para manipularlos
    rescue
        #puts "recata error"
        flash[:error_ciudad] = "No se puede eliminar la ciudad porque hay Hoteles registrados en #{@ciudad.nombre}"
        redirect_to ciudades_path            
    end

    private # Todo lo que está abajo 👇👇 es PRIVADO
    
    # recuperamos el :id de la URL 📦 y lo buscamos en la base de datos
    def asignar_ciudad
        @ciudad = Ciudad.find_by(id: params[:id])
        puts "ANTES ASIGNAR UNA CIUDAD".center(50, "🚥")
    end

    # extraer los datos del formulario 📦
    def params_ciudad
        return params.require(:ciudad).permit(:nombre)
    end
end