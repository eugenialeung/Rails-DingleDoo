Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/dingledoo')

  resources :dingledoo, only: [:index]

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show, :new, :create]

  resources :products


end

