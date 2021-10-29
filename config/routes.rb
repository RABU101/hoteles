Rails.application.routes.draw do
  #    ruta de ingreso url to: < metodo >
  # Roles
  get  'roles',          to: 'roles#listar', as: 'roles'
  get  'roles/nuevo',    to: 'roles#crear', as: 'nuevo_rol'
  post 'roles',          to: 'roles#guardar'
  # Ciudades
  get  'ciudades',            to: 'ciudades#listar', as: 'ciudades'
  get  'ciudades/nuevo',      to: 'ciudades#crear',  as: 'nueva_ciudad'
  get  'ciudades/:id/editar', to: 'ciudades#editar', as: 'editar_ciudad'
#  get  'ciudades/editar', to: 'ciudades#editar', as: 'editar_ciudad'
  post 'ciudades',            to: 'ciudades#guardar' 
end
