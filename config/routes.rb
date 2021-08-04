# config/routes.rb
Rails.application.routes.draw do
  resources :units, only: [:index, :show] do
    resources :measurements
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end