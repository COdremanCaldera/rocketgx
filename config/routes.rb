Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :videogames do
    get '/users/:id', to: 'users#show_seller', as: 'seller_profile'
    resources :purchases, only: [:new, :create]
  end
  resources :videogames, only: [:destroy]
  resources :purchases, only: [:destroy]

  get '/users/:id', to: 'users#show', as: 'user_profile'

  # Defines the root path route ("/")
  # root "posts#index"
end
