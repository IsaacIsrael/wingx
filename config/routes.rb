Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, except: [:show] do
    resources :flights
  end
  resources :orders, only: [:index, :show, :new, :create]
end
