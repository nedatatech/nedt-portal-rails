Rails.application.routes.draw do
  get 'home/index'

  resources :employees
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'
  root                   :to => 'home#index'
  get '/settings',        to: 'settings_data#settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
