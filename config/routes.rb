Rails.application.routes.draw do
  root to: 'users#index'
  resource :user do
    resources :genres, only: [:index, :new, :create]
  end


end
