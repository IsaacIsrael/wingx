Rails.application.routes.draw do
  get 'users/show'
  devise_for :controllers
  devise_for :views
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [:new, :create]
  get 'company', to: 'companies#show', as: :company

  get 'company/orders', to: 'companies#order', as: :company_orders
  resources :flights do
      resources :orders, only: [:new, :create]
  end
  get 'user', to: 'users#show', as: :user
end
