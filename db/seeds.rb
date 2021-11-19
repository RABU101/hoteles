# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Precarga para publicar/desplegar
# Definido la creación de 2 roles en una base de datos nueva

# destruir las tablas antes de cargar, en caso de querer borrar las tablas primero
Hotel.destroy_all

Rol.create([
    {rol: 'Cliente'},
    {rol: 'Administrador'},

])
puts "Roles creados"
# Creando usuarios
Usuario.create([
    {nombre: 'admin', telefono: '999999', identificacion: '100-0', password: 'admin', rol: Rol.find_by(rol: 'Administrador')},
    {nombre: 'cliente', telefono: '777777', identificacion: '200-0', password: 'qwerty', rol: Rol.find_by(rol: 'Cliente')}
])
puts "Usuarios creados"
# Creando las ciudades
Ciudad.create([
    {nombre: 'Santiago'},
    {nombre: 'Bogota'},
    {nombre: 'Caracas'},
    {nombre: 'Buenos Airess'},
    {nombre: 'Montevideo'},
    {nombre: 'Lima'}
])
puts "Ciudades creadas"

# cargar tabla con faker: Hoteles
10.times do
    Hotel.create(
        {
            nombre: Faker::Color.color_name, 
            estrellas: Faker::Number.between(from: 1, to: 5),
            ciudad: Ciudad.all.sample
         }
    )
end
puts "Hoteles creados"
# carga tabla con faker: Habitaciones
600.times do
    Habitacion.create(
        {
            nombre: Faker::Science.scientist,
            precio: Faker::Number.between(from: 10000, to: 15990),
            esta_reservada: Faker::Boolean.boolean,
            hotel: Hotel.all.sample
        }
    )
end