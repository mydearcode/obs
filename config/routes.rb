Rails.application.routes.draw do
  resources :reviews
  resources :products
  resources :brands
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  post 'auth/login', to: 'authentication#login'
  post 'products/:id/send_review', to: "products#send_review"



end
