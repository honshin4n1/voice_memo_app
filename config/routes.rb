Rails.application.routes.draw do
  devise_for :users
  
  root 'genres#index'
  namespace :contents do
    resources :searches, only: :index
  end
  resources :genres, except: :show do
    resources :contents, except: :show
  end
  get 'mypage', to: 'users#show'
  # resources :users, only: :show, path: '/', param: :name
  post '/genres/guest_1_sign_in', to: 'genres#new_guest_1'
  post '/genres/guest_2_sign_in', to: 'genres#new_guest_2'
  post '/genres/guest_3_sign_in', to: 'genres#new_guest_3'
end
