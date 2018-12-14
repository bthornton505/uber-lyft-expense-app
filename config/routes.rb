Rails.application.routes.draw do

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users

  # Routes for omniauth-github login
  get '/auth/github/callback' => 'sessions#create'

end
