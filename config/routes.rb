Rails.application.routes.draw do
  root 'home#show'
  devise_for :users
  resources :users, only: %i[show]
end
