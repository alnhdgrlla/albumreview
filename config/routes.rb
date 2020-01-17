Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'genre#index'

  resources :artists
  resources :albums do
    resources :songs, only: [:index, :new, :create, :show, :destroy]
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end
  resources :genres
end
