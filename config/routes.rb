Rails.application.routes.draw do
  devise_for :users
  root to: 'works#index'
  resources :works, only: [:index, :new, :create, :edit, :update]
  resources :users, only: [:show, :edit, :update]
end
