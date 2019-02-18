Rails.application.routes.draw do
  get 'companies/new'
  get 'companies/create'
  get 'companies/edit'
  get 'companies/update'
  get 'companies/destroy'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/create'
  get 'flights/index'
  get 'flights/show'
  get 'flights/new'
  get 'flights/create'
  get 'flights/edit'
  get 'flights/update'
  get 'flights/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :company do
    resources :flight
  end
  resources :order, only: [:index, :show, :new, :create]
end
