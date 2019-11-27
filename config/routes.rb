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

  resources :carts, only: [:show] 


  resources :cart_items, only: [:create, :destroy] 

  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_items_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_items_reduce"
  


  # get    'cart',     to: 'cart#index'

  # post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'


end

