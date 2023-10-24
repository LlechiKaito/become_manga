Rails.application.routes.draw do
  devise_for :users
  root to: 'works#index'
  resources :works do
    resources :comics do
      resources :read_count, only: [:create]
    end
  end
  resources :users, only: [:show, :edit, :update]
  
  resources :book_marks, only: [:index, :create, :destroy]

  resources :inquiries, only: [:new, :create]

  resources :nices, only: [:create, :destroy]

  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
