Rails.application.routes.draw do
  root 'drinks#index'
  devise_for :users
  resources :users, only: %i[show]
  resources :drinks, only: %i[index new create]
  resources :groups, only: %i[index show new create]
end
