Rails.application.routes.draw do
  resources :subproductos
  resources :productos
  resources :retrabajos
  resources :no_conformidads
  resources :documento_proyectos
  resources :detalle_produccions
  resources :parte_produccions
  resources :materials
  resources :escala_salarials
  resources :orden_servicios
  resources :tipo_orden_servicios
  resources :proyectos
  resources :tipo_obras
  resources :clientes
  resources :categoria
  get 'dashboards/index'
  resources :sectors
  resources :operarios
  get 'home/index'
  resources :tiempo_muertos
  resources :tipo_tiempo_muertos
  resources :tarea_realizadas
  resources :parte_diarios
  devise_for :usuarios
  resources :empresas
  get 'dashboard', to: 'dashboards#index', as: 'dashboard'
  get 'dashboard/fullscreen', to: 'dashboards#fullscreen', as: :dashboard_fullscreen
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
