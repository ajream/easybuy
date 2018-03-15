Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout
end
