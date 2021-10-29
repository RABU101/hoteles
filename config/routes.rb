Rails.application.routes.draw do
  #    ruta de ingreso url to: < metodo >
  # Roles
  get  'roles',          to: 'roles#listar', as: 'roles'
  get  'roles/nuevo',    to: 'roles#crear'
  post 'roles',          to: 'roles#guardar'
  # Ciudades
  get  'ciudades',       to: 'ciudades#listar', as: 'ciudades'
  get  'ciudades/nuevo', to: 'ciudades#crear'
  post 'ciudades',       to: 'ciudades#guardar' 
end
