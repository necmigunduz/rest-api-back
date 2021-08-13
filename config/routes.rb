# config/routes.rb
Rails.application.routes.draw do
  resources :authentication, only: [:create]
  resources :users, only: [:create]
  resources :units do
    resources :measurements, only: [:create, :update, :destroy]
  end
  resources :measurements, only: [:index]
end