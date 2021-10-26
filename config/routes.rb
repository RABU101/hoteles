Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # dos primeras rutas obligatorias
  # la tercera es opcional
  #    ruta de ingreso url to: < metodo >
  get 'roles/nuevo', to: 'roles#crear'
end
