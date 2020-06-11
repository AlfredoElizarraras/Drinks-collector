Rails.application.routes.draw do
  root 'home#show'
  devise_for :users
  resources :users, only: %i[show]
  resources :drinks, only: %i[index]
  resources :groups, only: %i[index]
end
