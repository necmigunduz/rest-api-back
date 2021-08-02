# config/routes.rb
Rails.application.routes.draw do
  resources :units do
    resources :measurements
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end