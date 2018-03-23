Rails.application.routes.draw do
  resources :item_locations
  resources :item_statuses
  resources :truck_inventories
  resources :trucks
  resources :inventory_items
  resources :item_sizes
  resources :item_brands
  resources :item_types
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
  post '/display_list', to: 'truck_inventories#display_list'
  get "/pages/:page" => "pages#show"
  get "/inventory/receive" => "inventory#receive"
  get "/inventory/order" => "inventory#order"
  get "/inventory/select_location" => "inventory#select_location"
  get "/inventory/select_item" => "inventory#select_item"
  get "/inventory/list_items" => "inventory#list_items"
  patch "/inventory/move_to_truck" => "inventory#move_to_truck"
  get "/inventory/select_truck" => "inventory#select_truck"
  post "/inventory_items/:id" => "inventory_items#receive"
  post "/inventory_items/move_to_truck/:id" => "inventory_items#move_to_truck"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
