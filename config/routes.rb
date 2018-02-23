Rails.application.routes.draw do
  resources :employee_tasks
  resources :company_tasks
  resources :statuses
  resources :owner_types
  resources :task_types
  #resources :payments
  resources :expenses
  resources :companies
  resources :settings_data
  get 'home/index'

  resources :customers
  resources :jobs
  resources :invoices
  resources :employees
  get    '/login',                to: 'sessions#new'
  post   '/login',                to: 'sessions#create'
  delete '/logout',               to: 'sessions#destroy'
  root                            :to => 'home#index'
  get '/settings',                to: 'settings_data#settings'
  get '/payments/select',          :to => 'payments#select_to_from'
  post '/payments/select',          :to => 'payments#store_to_from'
  resources :payments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


