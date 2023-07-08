Rails.application.routes.draw do
  get 'sessions/user'
  resources :recipes
  resources :users

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/recipes", to: "recipes#create"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

