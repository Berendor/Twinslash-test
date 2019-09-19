# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    devise_for :users

    namespace :admin do
      resources :advertisings_types
      resources :advertisings
      resources :users

      root to: 'advertisings#index'
    end

    resources :users

    resources :advertisings do
      member do
        delete :delete_image_attachment
        put :update_ad
      end
    end
    get 'homepage/index'
    root 'homepage#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
