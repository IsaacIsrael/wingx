Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, except: [:show]
  get 'company/flights/:id', to: 'flights#show'
  get 'company/flights', to: 'flights#index'
  resources :orders, only: [:index, :show, :new, :create]
end
