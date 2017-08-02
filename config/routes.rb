  Rails.application.routes.draw do
  root to: 'items#index'

  namespace :admin do
    resources :users, only: [:edit, :update, :show]
    get '/dashboard', to: 'users#dashboard'
  end

  get '/cart', to: 'carts#index'
  delete '/carts', to: 'carts#destroy'
  patch '/carts', to: 'carts#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  resources :items, only: [:index, :show]

  get '/dashboard', to: 'users#show'

  resources :carts, only: [:create]

  resources :orders, only: [:index, :show, :create]

  resources :users, only: [:new, :create]

  #reassure the dynamic get command is properly routed towards the end
  get "/:category_name", to: 'categories#show'

end
