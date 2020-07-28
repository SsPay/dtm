Rails.application.routes.draw do
  root 'users#index'
  get 'join', to: 'teams#join'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  resources :users
  resources :battles do
    collection do
      get 'join'
    end
  end
  resources :teams do
    collection do
      get 'join'
    end
  end
end
