Rails.application.routes.draw do

  root 'welcome#home'

  resources :users do
    resources :expense_reports, shallow: true
  end

# Routes to create expenses under associated expense_report
  get '/expense_reports/:expense_report_id/expenses' => 'expenses#index', :as => :expense_report_expenses
  get '/expense_reports/:expense_report_id/expenses/new' => 'expenses#new', :as => :new_expense_report_expense
  post '/expense_reports/:expense_report_id/expenses' => 'expenses#create'
  # get '/expense_reports/:expense_report_id/expenses/:expense_id/edit' => 'expenses#edit', :as => :edit_expense_report_expense
  # get '/expense_reports/:expense_report_id/expenses/:expense_id' => 'expenses#show', :as => :expense_report_expense
  # patch '/expense_reports/:expense_report_id/expenses/:expense_id' => 'expenses#update'

  # get '/expense_reports/:expense_report_id/expenses/new' => 'expenses#new', :as => :new_expense_report_expense
  # get '/expense_reports/:expense_report_id/expenses' => 'expenses#index', :as => :expense_report_expenses
  # post '/expense_reports/:expense_report_id/expenses' => 'expenses#create'

  resources :expenses, only: [:show, :edit, :update, :destroy]



  # resources :expenses, only: [:show, :edit, :update, :destroy]

  resources :categories

# Routes to create a new comment for an expense
  resources :comments
  # get '/expenses/:expense_id/comments/new' => 'comments#new', :as => :new_expense_comment
  # post '/expenses/:expense_id/comments' => 'comments#create', :as => :expense_comment

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # Routes for omniauth-github login
  get '/auth/github/callback' => 'sessions#create'

end
