Rails.application.routes.draw do

  root 'welcome#home'

  resources :users do
    resources :expense_reports, only: [:new, :create, :index]
  end

  resources :expense_reports, only: [:show, :edit, :update, :destroy] do
    resources :expenses
  end

  resources :categories

  resources :comments

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # Routes for omniauth-github login
  get '/auth/github/callback' => 'sessions#create'

end
