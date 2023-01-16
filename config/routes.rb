Rails.application.routes.draw do
  
  resources :products do
    resources :reviews do 
      resources :comments, module: :reviews
    end
  end
  resources :comments do
    resources :comments, module: :comments
  end

  resources :brands
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  post 'auth/login', to: 'authentication#login'




end
