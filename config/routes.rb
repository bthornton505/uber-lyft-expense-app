Rails.application.routes.draw do

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users do
    resources :expense_reports
  end

  # resources :expense_reports do
  #   resources :expenses
  # end

  # Routes for omniauth-github login
  get '/auth/github/callback' => 'sessions#create'

end
