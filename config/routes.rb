Rails.application.routes.draw do
  root 'home#index'

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :categories, only: :show
  resources :products, only: :show do
    get :search, on: :collection
  end
  resources :shopping_carts
  resources :addresses do
    member do
      put :set_default_address
    end
  end
  resources :orders
  resources :payments, only: :index do
    collection do
      get :generate_pay
      get :pay_return
      get :pay_notify
      get :success
      get :failed
    end
  end

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

  namespace :dashboard do
    scope 'profile' do
      controller :profile do
        get :password
        put :update_password
      end
    end

    resources :orders, only: [:index]
    resources :addresses, only: [:index]
  end

  resources :telephone_tokens, only: :create

end