Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :drives
  resources :payments
  resources :bills
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get 'clients_count', to: 'clients#count_clients'
  get 'drives_count', to: 'drives#count_drives'
  get 'bills_count', to: 'bills#count_bills'
  post '/reports/bills/calculate', :to => 'bills#calculate_bills'
  post '/reports/payments/calculate', :to => 'payments#calculate_payments'
end
