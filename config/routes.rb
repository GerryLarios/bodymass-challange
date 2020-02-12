Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
  get 'users/:id/category', to: 'users#category'
end
