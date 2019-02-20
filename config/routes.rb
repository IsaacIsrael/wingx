Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [:new, :create] do
    collection do
      get 'flights', to: 'flights#display_company'
    end
  end
  resources :flights, only: [:show, :destroy, :new, :create] do
      resources :orders, only: [:new, :create]
  end

end
