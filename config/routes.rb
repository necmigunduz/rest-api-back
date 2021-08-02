# config/routes.rb
Rails.application.routes.draw do
  resources :units do
    resources :measurements
  end
end