Rails.application.routes.draw do
  get 'events/new'

  root    'welcome#index'
  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  resources :users
  resources :events
end
