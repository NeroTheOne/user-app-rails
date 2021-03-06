Rails.application.routes.draw do
  env = Rails.env
  production_host = 'blooming-harbor-14086.herokuapp.com'
  local_host = 'localhost:3000'
  default_url_options :host => (env == "production") ? production_host : local_host

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'session/new'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activation, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
