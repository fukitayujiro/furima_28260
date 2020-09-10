Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :items do
    resources :transactions
  end
  get 'items/new', to: 'items#itemprice'
end
