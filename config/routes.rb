Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/dingledoo')

  resources :dingledoo, only: [:index, :show] do
    collection do
      get :shop
    end
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show, :new, :create] do
    collection do
      get :new_admin
      post :create_admin
    end
  end

  resources :products

  resources :cart_items, only: [:create, :destroy, :update]

  get    'cart',     to: 'cart#index'

  # post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'


end

