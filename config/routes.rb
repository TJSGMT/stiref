Rails.application.routes.draw do
  root "users#index"
  resources :users
  # get '/get_users', to: "users#index"


  get '/get_users', to: "users#getusers"
end
