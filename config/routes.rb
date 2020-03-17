Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => 'omniauth_callbacks' }
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  root 'tutorial#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

