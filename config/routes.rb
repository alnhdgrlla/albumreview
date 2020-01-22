Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'genres#index'

  resources :genres do
    resources :artists
    resources :albums
  end
  resources :albums do
    resources :songs, only: [:index, :new, :create, :show, :destroy]
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end
end
