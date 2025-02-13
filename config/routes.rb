Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :unidades
  resources :setores
  resources :funcionarios
  resources :visitantes
  resources :visitas

  root to: "devise/sessions#new"
end

