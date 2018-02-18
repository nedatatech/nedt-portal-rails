Rails.application.routes.draw do
  resources :invoices
  resources :payments
  resources :employees
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
