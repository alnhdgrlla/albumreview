Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists
  resources :albums
    resources :reviews, only: [ :new, :create, :show, :destroy ] do
  end
  resources :songs
  resources :genre, only: [:index]
end
