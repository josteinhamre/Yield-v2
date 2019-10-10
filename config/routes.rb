Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :transactions, only: [ :index, :create ]
  resources :categories, only: [ :index, :new, :create ]
  resources :budgets, only: [ :create, :update ]
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/dashboard', to: 'dashboard#dashboard', as: 'dashboard'
  get '/inbox', to: 'transactions#inbox', as: 'inbox'
  get '/import', to: 'pages#import', as: 'import'
  patch '/cat_next_month', to: 'categories#next_month', as: 'cat_next_month'
  patch '/cat_prev_month', to: 'categories#prev_month', as: 'cat_prev_month'
  patch '/confirm/:id', to: 'transactions#confirm', as: 'confirm'
  patch '/set_category/:id/:category_id', to: 'transactions#set_category', as: 'set_category'
  get '/testpage', to: 'pages#testpage', as: 'testpage'
  patch '/trans_next_month', to: 'transactions#next_month', as: 'trans_next_month'
  patch '/trans_prev_month', to: 'transactions#prev_month', as: 'trans_prev_month'
  get '/spent_data', to: 'dashboard#spent_data', as: 'spent_data'
  get '/balance_data', to: 'dashboard#balance_data', as: 'balance_data'
  get '/budgeted_data', to: 'dashboard#budgeted_data', as: 'budgeted_data'
  patch '/dash_next_month', to: 'dashboard#next_month', as: 'dash_next_month'
  patch '/dash_prev_month', to: 'dashboard#prev_month', as: 'dash_prev_month'

end
