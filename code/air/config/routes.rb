OneWayAir::Application.routes.draw do

  get "sign_in" => 'sessions#new', :as => :sign_in

  post "sessions/create"

  get "sessions/destroy" => 'sessions#destroy', :as => :sign_out

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users
  # get "/my_profile" => 'users#show', :as => :user

  root to: 'flights#index'

end
