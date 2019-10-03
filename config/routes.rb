Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "pages#dashboard"
  end
  root to: 'pages#home'
  resources :transactions, only: [ :index ]
  resources :categories, only: [ :index ]
  get '/profile', to: 'pages#profile', as: 'profile'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/inbox', to: 'transactions#inbox', as: 'inbox'
  patch '/confirm/:id', to: 'transactions#confirm', as: 'confirm'
  patch '/set_category/:id/:category_id', to: 'transactions#set_category', as: 'set_category'
  get '/testpage', to: 'pages#testpage', as: 'testpage'
end
