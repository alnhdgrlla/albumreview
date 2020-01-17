Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'genre#index'

  resources :artist
  resources :album do
    resources :song, only: [:index, :new, :create, :show, :destroy]
    resources :review, only: [:index, :new, :create, :show, :destroy]
  end
  resources :genre
end
