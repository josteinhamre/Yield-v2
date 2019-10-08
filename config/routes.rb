Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "pages#dashboard"
  end
  root to: 'pages#home'
  resources :transactions, only: [ :index ]
  resources :categories, only: [ :index ]
  resources :budgets, only: [ :create, :update ]
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/inbox', to: 'transactions#inbox', as: 'inbox'
  patch '/cat_next_month', to: 'categories#next_month', as: 'cat_next_month'
  patch '/cat_prev_month', to: 'categories#prev_month', as: 'cat_prev_month'
  patch '/confirm/:id', to: 'transactions#confirm', as: 'confirm'
  patch '/set_category/:id/:category_id', to: 'transactions#set_category', as: 'set_category'
  get '/testpage', to: 'pages#testpage', as: 'testpage'
  patch '/trans_next_month', to: 'transactions#next_month', as: 'trans_next_month'
  patch '/trans_prev_month', to: 'transactions#prev_month', as: 'trans_prev_month'
  get '/spent_data', to: 'pages#spent_data', as: 'spent_data'

end
