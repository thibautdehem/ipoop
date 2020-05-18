Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :toilets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
