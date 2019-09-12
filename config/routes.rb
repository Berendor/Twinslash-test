Rails.application.routes.draw do
  namespace :admin do
      resources :advertisings
      resources :users

      root to: "advertisings#index"
    end
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :advertisings do
    member do
      delete :delete_image_attachment
    end
  end

  get 'homepage/index'
  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
