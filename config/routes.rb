Rails.application.routes.draw do
  resources :payment_to_froms
  resources :payments
  resources :types
  resources :statuses
  resources :expenses
  resources :companies
  resources :settings_data
  get 'home/index'

  resources :customers
  resources :jobs
  resources :invoices
  resources :employees
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'
  root                   :to => 'home#index'
  get '/settings',        to: 'settings_data#settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
