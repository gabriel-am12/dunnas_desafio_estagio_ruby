Rails.application.routes.draw do
  get "atendente/dashboard"
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  authenticated :user do |u|
    if u&.admin?
      root to: "admin#dashboard", as: :admin_dashboard
    elsif u&.atendente?
      root to: "atendente#dashboard", as: :atendente_dashboard
    else
      root to: "visitas#index", as: :user_root
    end
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

  resources :visitas, only: [:index, :new, :create, :show]

end

