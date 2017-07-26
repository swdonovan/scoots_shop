Rails.application.routes.draw do
  root to: 'items#index'

  resources :items, only: :index

  get "/:category_name", to: 'categories#show'

end
