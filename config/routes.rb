Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items do
    resources :transactions
  end
  get 'items/new', to: 'items#itemprice'
end
