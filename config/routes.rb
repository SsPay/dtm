Rails.application.routes.draw do
  root 'users#index'
  get 'join', to: 'teams#join'
  # get '/pages/:page' => 'pages#show'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users
  resources :battles do
    collection do
      get 'join'
      get 'set_winner'
    end
  end
  resources :teams do
    collection do
      get 'join'
    end
  end
  resources :pages do
    collection do
      get 'search'
    end
  end
end
