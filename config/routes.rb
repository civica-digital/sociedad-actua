Rails.application.routes.draw do
  devise_for :users

  root to: 'visitors#index'

  get '/auth/:provider/callback' => 'sessions#create'

  as :user do
    get  '/register' => 'users/registrations#new', :as => :registration_new
    post '/register' => 'users/registrations#create', :as => :registration
    get  '/login' => 'devise/sessions#new', :as => :signin
    post '/login' => 'devise/sessions#create', :as => :session
    get  '/logout' => 'devise/sessions#destroy', :as => :signout
  end

  get '/auth/failure' => 'sessions#failure'

  resources :organizations
  resources :collaborators

  resources :investors
end
