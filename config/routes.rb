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

  resources :organizaciones,as: :organizations, :path_names => {:edit => "editar", :new => "nuevo" }, controller: :organizations 
  resources :colaboradores,as: :collaborators, :path_names => {:edit => "editar", :new => "nuevo" }, controller: :collaborators 
  resources :inversionistas,as: :investors, :path_names => {:edit => "editar", :new => "nuevo" }, controller: :investors 

end
