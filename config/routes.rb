Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, except: [:show] do
    collection do
      get 'flights', to: 'flights#index'
    end
  end
  resources :flights, only: [:show, :destroy]
  resources :orders, only: [:index, :show, :new, :create]
end
