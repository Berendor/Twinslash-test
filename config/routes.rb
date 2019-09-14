Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
      resources :advertisings_types
      resources :advertisings
      resources :users

      root to: "advertisings#index"
    end

  resources :users

  resources :advertisings do
    member do
      delete :delete_image_attachment
    end
  end

  get 'homepage/index'
  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
