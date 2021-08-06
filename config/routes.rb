# config/routes.rb
Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  resources :units do
    resources :measurements, only: [:create, :update, :destroy]
  end
  resources :measurements, only: [:index]
end