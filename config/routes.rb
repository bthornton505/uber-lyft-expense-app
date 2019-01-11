Rails.application.routes.draw do

  root 'welcome#home'

  get '/expense_reports/by_year' => 'expense_reports#by_year'
  # get '/users/:user_id/expense_reports/current_report' => 'expense_reports#current_report', as: "users_current_expense_report"

  resources :users do
    resources :expense_reports, only: [:new, :create, :index, :edit, :update]
  end

  resources :expense_reports, only: [:show, :destroy] do
    resources :expenses
  end

  resources :comments, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Routes for omniauth-github login
  get '/auth/github/callback' => 'sessions#create'

end
