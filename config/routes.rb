Rails.application.routes.draw do
  root 'home#index'

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :categories, only: :show
  resources :products, only: :show
  resources :shopping_carts
  resources :addresses do
    member do
      put :set_default_address
    end
  end
  resources :orders
  resources :payments, only: :index

  namespace :admin do
    root 'sessions#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout' => 'sessions#destroy', as: :logout
    resources :categories
    resources :products do
      resources :product_images, only: [:index, :create, :update, :destroy]
    end
  end

end
