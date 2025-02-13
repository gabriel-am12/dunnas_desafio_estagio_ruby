Rails.application.routes.draw do
  devise_for :users

  resources :unidades
  resources :setores
  resources :funcionarios
  resources :visitantes
  resources :visitas

  root 'visitas#index' # Página inicial mostrando visitas registradas
end

