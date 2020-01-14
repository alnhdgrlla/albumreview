Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists
  resources :albums do
    resources :songs
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end
  resources :genre, only: [:index]
end
