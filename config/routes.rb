Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: :create
  end

  patch "users/:id/helper", to: "users#toggle_helper", as: :user_toggle_helper
  resources :users, only: [:show, :update] do
    resources :selected_themes, only: :create
  end
  resources :selected_themes, only: :destroy
  resources :posts, only: [:index, :show, :create]

  resources :requests, only: [:create, :new] do
    resources :matching_profiles, only: [:index, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
