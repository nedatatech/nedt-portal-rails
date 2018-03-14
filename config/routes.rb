Rails.application.routes.draw do
  resources :truck_inventories
  resources :inventory_items
  resources :item_types
  resources :item_locations
  resources :expenses
  resources :companies
  resources :status_data
  resources :settings_data
  get 'home/index'

  resources :customers
  resources :jobs
  resources :invoices
  resources :payments
  resources :employees
  get    '/login',               to: 'sessions#new'
  post   '/login',               to: 'sessions#create'
  delete '/logout',              to: 'sessions#destroy'
  root                           :to => 'home#index'
  get '/settings',               to: 'settings_data#settings'
  get '/truck_inventory_status', to: 'truck_inventories#status'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
