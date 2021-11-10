     - [x] Analizar la lógica para mostrar el resultado
     - [ ] Definir las tarjetas donde se mostrará el resultado

       - [x] Crear un archivo nuevo que se llame *_tarjeta.html.erb* en la carpeta *app/views/paginas*
       - [x] Definir una ruta para mostrar la información de 1 solo hotel

       ```ruby
       #config/routes.rb
        get   'paginas/:id_hotel', to: 'paginas#info_hotel', as: 'info_hotel'
       ```

       - [x] Definir el método que  mostrará la vista en el controlador de páginas

       ```ruby
       
        # GET /paginas/:id_hotel
        def info_hotel
            
        end
       ```

       - [x] Crear el archivo *info_hotel.html.erb* para mostrar la información detallada del hotel

4. Reservar una habitación

### Opcionales

1. Iniciar sesión

   - [ ] Un botón que nos envíe al formulario para registrarnos
   - [ ] Definir una ruta que permita mostrar el formulario de registro
   - [ ] Definir un controlador y método que se haga cargo del formulario
   - [ ] Crear el archivo de la vista con el formulario
   - [ ] Definir un método para la lógica de registro de usuario
   - [ ] Definir un método para la lógica de iniciar sesión

2. Tener vistas de administrador
3. Buscador de hoteles por nombre en la página principal 🔁