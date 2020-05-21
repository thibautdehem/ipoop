Rails.application.routes.draw do
  root to: 'toilets#index'
  devise_for :users
  resources :toilets do
    resources :bookings, only: [ :new, :create, :edit, :update]
  end
  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
