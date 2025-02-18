Rails.application.routes.draw do
  get "atendente/dashboard"
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  authenticated :user do |u|
    if u&.admin?
      root to: "admin#dashboard", as: :admin_dashboard
    elsif u&.atendente?
      root to: "atendente#dashboard", as: :atendente_dashboard
    elsif u&.funcionario?
      root to: "funcionarios#dashboard", as: :dashboard_funcionario
    else
      root to: "devise/sessions#new", as: :user_root
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
    get 'dashboard', to: 'dashboard'
  end

  namespace :funcionarios do
    get 'dashboard', to: 'dashboard'
  end

  resources :visitas, only: [:index, :new, :create, :show, :destroy] do
    member do
      patch 'finalizar' 
    end
  end

  resources :visitantes do
    collection do
      get 'buscar', to: 'visitantes#buscar'
    end
  end
end

