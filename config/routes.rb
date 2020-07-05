Rails.application.routes.draw do
  root 'users#index'
  get 'join', to: 'teams#join'
  devise_for :users
  resources :user
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
