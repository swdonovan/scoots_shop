Rails.application.routes.draw do
  root to: 'items#index'
  get '/cart', to: 'carts#index'

  resources :items, only: :index

  resources :carts, only: :create
  
  #reassure the dynamic get command is properly routed towards the end
  get "/:category_name", to: 'categories#show'

end
