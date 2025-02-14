Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  authenticated :user, ->(u) { u.administrador? } do
    root to: 'admin#dashboard', as: :admin_dashboard
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  namespace :admin do
    resources :users
    resources :unidades 
    resources :setores 
    resources :funcionarios 
    get 'admin/dashboard', to: 'admin#dashboard'
  end

end

