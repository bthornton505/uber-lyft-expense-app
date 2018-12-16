Rails.application.routes.draw do

  root 'welcome#home'

  resources :users do
    resources :expense_reports, shallow: true
  end

  # resources :expense_reports do
  #   resources :expenses
  # end


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # Routes for omniauth-github login
  get '/auth/github/callback' => 'sessions#create'

end
