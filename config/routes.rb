Rails.application.routes.draw do
  get 'reviews/create'
  root to: 'toilets#index'
  devise_for :users
  resources :toilets do
    resources :bookings, only: [:show, :new, :create, :edit, :update]
    resources :reviews, only: :create
  end
  resources :bookings, only: [ :index, :destroy]
  resources :reviews, only: [ :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
