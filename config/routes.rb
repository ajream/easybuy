Rails.application.routes.draw do
  root 'home#index'

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  namespace :admin do
    root 'sessions#new'
    resources :categories
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout' => 'sessions#destroy', as: :logout
  end

end
