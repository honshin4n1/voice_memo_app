Rails.application.routes.draw do
  devise_for :users
  
  root 'genres#index'
  namespace :contents do
    resources :searches, only: :index
  end
  resources :genres, only: [:index, :new, :create, :update] do
    resources :contents, only: [:index, :new, :create, :update]
  end
  resources :users, only: [:show]
end
