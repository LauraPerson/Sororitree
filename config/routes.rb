Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: :create
  end

  resources :users, only: :show
  resources :posts, only: [:index, :show, :create]

  resources :requests, only: [:create, :new] do
    resources :matching_profiles, only: [:index, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
