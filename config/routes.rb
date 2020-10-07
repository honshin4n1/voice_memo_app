Rails.application.routes.draw do
  devise_for :users
  
  root 'genres#index'
  namespace :contents do
    resources :searches, only: :index
  end
  resources :genres, except: [:show] do
    resources :contents, except: [:show]
  end
  resources :users, only: [:show]
end
