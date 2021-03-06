Rails.application.routes.draw do
  resources :invoice_numbers
  resources :invoice_items
  resources :invoices, :except => [:show]
  resources :order_statuses
  get 'cart/show'

  resources :order_items
  resources :in_stock_items
  resources :sold_items
  resources :reserved_items
  resources :vendors
  resources :orders, :except => [:show]
  resources :item_locations
  resources :trucks
  resources :inventory_items
  resources :item_sizes
  resources :item_brands
  resources :item_types
  resources :expenses
  resources :companies
  get 'home/index'

  resources :customers
  resources :jobs
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
  #get "/orders/build" => "orders#build"
  get "/inventory/select_location" => "inventory#select_location"
  get "/inventory/select_item" => "inventory#select_item"
  get "/inventory/list_items" => "inventory#list_items"
  patch "/inventory/move_to_truck" => "inventory#move_to_truck"
  get "/inventory/select_truck" => "inventory#select_truck"
  post "/inventory_items/:id" => "inventory_items#receive"
  post "/inventory_items/move_to_truck/:id" => "inventory_items#move_to_truck"
  get "/inventory/list" => "inventory#list"
  post "/inventory/display_list" => "inventory#display_list"
  get "/inventory/display_list" => "inventory#display_list"
  post "/orders/:id" => "orders#receive"
  get "/orders/pending" => "orders#pending"
  get "/orders/completed" => "orders#completed"
  get "/orders/:id(.:format)" => "orders#show"

  get "/invoices/list" => "invoices#list"
  get "/invoices/:id(.:format)" => "invoices#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
