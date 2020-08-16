Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  scope '(:locale)', locale: /pt/ do
    root to: 'pages#home'

    resources :chatrooms, only: [:show, :create, :destroy] do
      resources :messages, only: :create
    end

    resources :professionals, only: [:create, :destroy]

    patch "users/:id/professional_status", to: "users#toggle_professional", as: :user_toggle_professional


    patch "users/:id/helper", to: "users#toggle_helper", as: :user_toggle_helper
    patch "users/:id/remove_photo", to: "users#destroy_photo", as: :user_destroy_photo
    resources :users, only: [:show] do
      resources :selected_themes, only: :create
      member do
        get :my_posts
      end
    end
    resources :selected_themes, only: :destroy
    resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    end

    resources :requests, only: [:create, :new] do
      resources :matching_profiles, only: [:new, :create]
    end

    resources :matching_profiles, only: [:index]
    patch "matching_profiles/:id/accepted_true", to: "matching_profiles#accepted_true", as: :accepted_true
    patch "matching_profiles/:id/accepted_false", to: "matching_profiles#accepted_false", as: :accepted_false
    resources :profile_avatars, only: [ :create, :new, :update]
  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
