Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :transactions, only: [ :index ]
  resources :categories, only: [ :index ]
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/inbox', to: 'transactions#inbox', as: 'inbox'
  patch '/confirm', to: 'transactions#confirm', as: 'confirm'
end
