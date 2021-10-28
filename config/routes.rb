Rails.application.routes.draw do
  # dos primeras rutas obligatorias
  # la tercera es opcional
  #    ruta de ingreso url to: < metodo >
  get   'roles/nuevo',  to: 'roles#crear'
  post  'roles',        to: 'roles#guardar'
end
