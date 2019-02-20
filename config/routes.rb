Rails.application.routes.draw do
  get 'users/show'
  devise_for :controllers
  devise_for :views
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies, only: [:new, :create]
  get 'company', to: 'companies#show', as: :company
  resources :flights
  resources :orders, only: [:index, :show, :new, :create]
  get 'user/:id', to: 'users#show', as: :user
  # resources :users, only: [:show]
end
