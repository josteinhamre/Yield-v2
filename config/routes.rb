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
  patch '/next_month', to: 'categories#next_month', as: 'next_month'
  patch '/prev_month', to: 'categories#prev_month', as: 'prev_month'
  patch '/confirm/:id', to: 'transactions#confirm', as: 'confirm'
  patch '/set_category/:id/:category_id', to: 'transactions#set_category', as: 'set_category'
  get '/testpage', to: 'pages#testpage', as: 'testpage'

end
