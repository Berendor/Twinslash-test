Rails.application.routes.draw do
  get 'homepage/index'


  resources :advertisings

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
