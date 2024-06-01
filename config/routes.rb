Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  delete 'logout', to: 'sessions#destroy', as: :logout

  resources :posts
  resources :users, only: [:show] do
    member do
      get 'profile', to: 'users#show', as: 'profile'
    end
  end

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'home#index', as: :unauthenticated_root
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
