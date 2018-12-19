Rails.application.routes.draw do

  root 'welcome#home'

  resources :users do
    resources :expense_reports, shallow: true
  end

# Routes to create expenses under associated expense_report
  get '/expense_reports/:expense_report_id/expenses/new' => 'expenses#new', :as => :new_expense_report_expense
  get '/expense_reports/:expense_report_id/expenses' => 'expenses#index', :as => :expense_report_expenses
  post '/expense_reports/:expense_report_id/expenses' => 'expenses#create'
  get '/expenses/:expense_id' => 'expenses#show', :as => :expense

  resources :categories

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # Routes for omniauth-github login
  get '/auth/github/callback' => 'sessions#create'

end
